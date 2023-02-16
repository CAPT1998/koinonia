/*
 * Copyright 2019 Florent37
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * The source code used herein has been modified and added to.
 */

import 'dart:math' as math;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

export 'package:assets_audio_player/assets_audio_player.dart';

class FlutterFlowAudioPlayer extends StatefulWidget {
  const FlutterFlowAudioPlayer({
    required this.audio,
    required this.titleTextStyle,
    required this.playbackDurationTextStyle,
    required this.fillColor,
    required this.playbackButtonColor,
    required this.activeTrackColor,
    required this.elevation,
  });

  final Audio audio;
  final TextStyle titleTextStyle;
  final TextStyle playbackDurationTextStyle;
  final Color fillColor;
  final Color playbackButtonColor;
  final Color activeTrackColor;
  final double elevation;

  @override
  _FlutterFlowAudioPlayerState createState() => _FlutterFlowAudioPlayerState();
}

class _FlutterFlowAudioPlayerState extends State<FlutterFlowAudioPlayer> {
  AssetsAudioPlayer? _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    openPlayer();
  }

  Future openPlayer() async {
    _assetsAudioPlayer ??=
        AssetsAudioPlayer.withId(generateRandomAlphaNumericString());
    if (_assetsAudioPlayer?.playlist != null) {
      _assetsAudioPlayer!.playlist!.replaceAt(0, (oldAudio) => widget.audio);
    } else {
      await _assetsAudioPlayer!.open(
        Playlist(audios: [widget.audio]),
        autoStart: false,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
      );
    }
  }

  @override
  void dispose() {
    _assetsAudioPlayer?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlutterFlowAudioPlayer old) {
    super.didUpdateWidget(old);
    final changed = old.audio.path != widget.audio.path ||
        old.audio.audioType != widget.audio.audioType;
    final isPlaying = _assetsAudioPlayer?.isPlaying.value ?? false;
    if (changed && !isPlaying) {
      openPlayer();
    }
  }

  Duration currentPosition(RealtimePlayingInfos infos) => infos.currentPosition;
  Duration duration(RealtimePlayingInfos infos) => infos.duration;

  String playbackStateText(RealtimePlayingInfos infos) {
    final currentPositionString = durationToString(currentPosition(infos));
    final durationString = durationToString(duration(infos));
    return '$currentPositionString/$durationString';
  }

  @override
  Widget build(BuildContext context) =>
      _assetsAudioPlayer!.builderRealtimePlayingInfos(
          builder: (context, infos) => PlayerBuilder.isPlaying(
              player: _assetsAudioPlayer!,
              builder: (context, isPlaying) {
                final childWidget = Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: widget.fillColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15, 10, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.audio.metas.title ?? 'Audio Title',
                                  style: widget.titleTextStyle,
                                ),
                                Text(
                                  playbackStateText(infos),
                                  style: widget.playbackDurationTextStyle,
                                )
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(34),
                            child: Material(
                              color: Colors.transparent,
                              child: IconButton(
                                onPressed: _assetsAudioPlayer!.playOrPause,
                                icon: Icon(
                                  (isPlaying)
                                      ? Icons.pause_circle_filled_rounded
                                      : Icons.play_circle_fill_rounded,
                                  color: widget.playbackButtonColor,
                                  size: 34,
                                ),
                                iconSize: 34,
                              ),
                            ),
                          ),
                        ],
                      ),
                      PositionSeekWidget(
                        currentPosition: currentPosition(infos),
                        duration: duration(infos),
                        seekTo: (to) {
                          _assetsAudioPlayer!.seek(to);
                        },
                        activeTrackColor: widget.activeTrackColor,
                      ),
                    ],
                  ),
                );
                return Material(
                    color: Colors.transparent,
                    elevation: widget.elevation,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: childWidget);
              }));
}

class PositionSeekWidget extends StatefulWidget {
  const PositionSeekWidget({
    required this.currentPosition,
    required this.duration,
    required this.seekTo,
    required this.activeTrackColor,
  });

  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;
  final Color activeTrackColor;

  @override
  _PositionSeekWidgetState createState() => _PositionSeekWidgetState();
}

class _PositionSeekWidgetState extends State<PositionSeekWidget> {
  late Duration _visibleValue;
  bool listenOnlyUserInteraction = false;
  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(PositionSeekWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInteraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: widget.activeTrackColor,
          inactiveTrackColor: const Color(0xFFC9D0D5),
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: 6.0,
          thumbShape: SliderComponentShape.noThumb,
          overlayColor: const Color(0xFF57636C).withAlpha(32),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 12.0),
        ),
        child: Slider(
          min: 0,
          max: widget.duration.inMilliseconds.toDouble(),
          value: math.min(1.0, percent) *
              widget.duration.inMilliseconds.toDouble(),
          onChangeEnd: (newValue) => setState(() {
            listenOnlyUserInteraction = false;
            widget.seekTo(_visibleValue);
          }),
          onChangeStart: (_) =>
              setState(() => listenOnlyUserInteraction = true),
          onChanged: (newValue) => setState(
              () => _visibleValue = Duration(milliseconds: newValue.floor())),
        ),
      );
}

String durationToString(Duration duration) {
  String twoDigits(int n) => (n >= 10) ? '$n' : '0$n';

  final twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour).toInt());
  final twoDigitSeconds = twoDigits(
      duration.inSeconds.remainder(Duration.secondsPerMinute).toInt());
  return '$twoDigitMinutes:$twoDigitSeconds';
}

String generateRandomAlphaNumericString() {
  const chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  return String.fromCharCodes(Iterable.generate(
      8, (_) => chars.codeUnits[math.Random().nextInt(chars.length)]));
}
