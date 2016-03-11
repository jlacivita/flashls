/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
 package org.mangui.osmf.plugins.traits {
    import org.mangui.hls.HLS;
    import org.mangui.hls.event.HLSEvent;
    import org.mangui.hls.event.HLSPlayMetrics;
    import org.mangui.hls.model.Level;
    import org.osmf.traits.MediaTraitBase;
    import org.mangui.hls.demux.ID3Tag;
    import org.mangui.osmf.plugins.events.HLSID3Event;

    CONFIG::LOGGING {
    import org.mangui.hls.utils.Log;
    }

    public class HLSID3Trait extends MediaTraitBase {
        private var _hls : HLS;

        public function HLSID3Trait(hls : HLS) {
            CONFIG::LOGGING {
            Log.debug("HLSID3Trait()");
            }
            super(HLSMediaTraitType.ID3);

            _hls = hls;
            _hls.addEventListener(HLSEvent.FRAGMENT_PLAYING, _fragmentPlayingHander);
        }

        override public function dispose() : void {
            CONFIG::LOGGING {
            Log.debug("HLSID3Trait:dispose");
            }
            _hls.removeEventListener(HLSEvent.FRAGMENT_PLAYING, _fragmentPlayingHander);
            super.dispose();
        }

        /** Update playback position/duration **/
        private function _fragmentPlayingHander(event : HLSEvent) : void {
            var id3s : Array = (event.playMetrics ? event.playMetrics.id3tag_list : []);

            for (var i=0; i<id3s.length; i++)
            {
                dispatchEvent(new HLSID3Event(HLSID3Event.ID3, false, false, id3s));
            }
        }
    }
}