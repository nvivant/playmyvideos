/*-
 * Copyright (c) 2017-2017 Artem Anufrij <artem.anufrij@live.de>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * The Noise authors hereby grant permission for non-GPL compatible
 * GStreamer plugins to be used and distributed together with GStreamer
 * and Noise. This permission is above and beyond the permissions granted
 * by the GPL license by which Noise is covered. If you modify this code
 * you may extend this exception to your version of the code, but you are not
 * obligated to do so. If you do not wish to do so, delete this exception
 * statement from your version.
 *
 * Authored by: Artem Anufrij <artem.anufrij@live.de>
 */

namespace PlayMyVideos.Utils {
    public static string get_title_from_basename (string basename) {
        int index = basename.last_index_of_char ('.');
        if (index > -1) {
            return basename.substring (0, index);
        }
        return basename;
    }

    public static int get_year_from_basename (string basename) {
        int return_value = 0;

        try {
            var regex = new GLib.Regex ("(?<=\\()[12]\\d\\d\\d(?=\\)\\.)");
            MatchInfo match_info;
            if (regex.match (basename, 0, out match_info)) {
                return_value = int.parse (match_info.fetch (0));
            }
        } catch (Error err) {
            warning (err.message);
        }

        return return_value;
    }

    public static string[] subtitle_extentions () {
        return {"sub", "srt", "smi", "ssa", "ass", "asc"};
    }
}
