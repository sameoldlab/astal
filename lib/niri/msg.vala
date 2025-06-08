namespace AstalNiri {
public class msg : Object {
    public static void init() {
      ActionFields.register_serialize_funcs();
    }

    public static string? send(string message) {
        IPC ipc;

        try {
            ipc = IPC.connect();
            if (ipc == null ) return null;
            var istream = ipc.send(Json.from_string(message));
            var line = istream.read_line();
            return line;
        } catch (Error err) {
            critical("command Error: %s", err.message);
            return err.message;
        } finally {
            ipc.close();
        }
    }

    public static async string send_async(string message) {
        IPC ipc;
        try {
            ipc = IPC.connect();
            if (ipc == null ) return "no ipc";
            var istream = ipc.send(Json.from_string(message));
            var line = yield istream.read_line_async();
            critical("%s", line);
            return line;
        } catch (Error err) {
            critical("command Error: %s", err.message);
            return err.message;
        } finally {
            ipc.close();
        }
    }


    // 
    // Simple Actions
    // 
    /** Formats a simple action for Niri's IPC   */
    private static bool send_act(string str, string fields = "{}") {
        var cmd = "{\"Action\":{\"%s\":%s}}\n".printf(str, fields);
        print("Sending: %s", cmd);
        var res = send(cmd);
        critical(res);
        if (res == "{\"Ok\":\"Handled\"}") return true;
        return false;
    }

    public static bool quit(bool skip_confirmation) {
      return send_act("Quit", new Actions.Quit(skip_confirmation).to_string());
    }

    public static bool power_off_monitors() {
      return send_act("PowerOffMonitors");
    }

    public static bool power_on_monitors() {
      return send_act("PowerOnMonitors");
    }

    public static bool spawn(string[] command) {
      return send_act("Spawn", new Actions.Spawn(command).to_string());
    }

    public static bool do_screen_transition(uint16? delay_ms) {
      return send_act("DoScreenTransition", new Actions.DoScreenTransition(delay_ms).to_string());
    }

    public static bool screenshot(bool show_pointer) {
      return send_act("Screenshot", new Actions.Screenshot(show_pointer).to_string());
    }

    public static bool screenshot_screen(bool write_to_disk, bool show_pointer) {
      return send_act("ScreenshotScreen", new Actions.ScreenshotScreen(write_to_disk, show_pointer).to_string());
    }
    
    public static bool screenshot_window(uint64? id, bool write_to_disk) {
      return send_act("ScreenshotWindow", new Actions.ScreenshotWindow(id, write_to_disk).to_string());
    }

    public static bool toggle_keyboard_shortcuts_inhibit() {
      return send_act("ToggleKeyboardShortcutsInhibit");
    }

    public static bool close_window(uint64? id) {
      return send_act("CloseWindow", new Actions.CloseWindow(id).to_string());
    }

    public static bool fullscreen_window(uint64? id) {
      return send_act("FullscreenWindow", new Actions.FullscreenWindow(id).to_string());
    }

    public static bool toggle_windowed_fullscreen(uint64? id) {
      return send_act("ToggleWindowedFullscreen", new Actions.ToggleWindowedFullscreen(id).to_string());
    }

    public static bool focus_window(uint64 id) {
      return send_act("FocusWindow", new Actions.FocusWindow(id).to_string());
    }

    public static bool focus_window_in_column(uint8 index) {
      return send_act("FocusWindowInColumn", new Actions.FocusWindowInColumn(index).to_string());
    }

    public static bool focus_window_previous() {
      return send_act("FocusWindowPrevious");
    }

    public static bool focus_column_left() {
      return send_act("FocusColumnLeft");
    }

    public static bool focus_column_right() {
      return send_act("FocusColumnRight");
    }

    public static bool focus_column_first() {
      return send_act("FocusColumnFirst");
    }

    public static bool focus_column_last() {
      return send_act("FocusColumnLast");
    }

    public static bool focus_column_right_or_first() {
      return send_act("FocusColumnRightOrFirst");
    }

    public static bool focus_column_left_or_last() {
      return send_act("FocusColumnLeftOrLast");
    }

    public static bool focus_column(size_t index) {
      return send_act("FocusColumn", new Actions.FocusColumn(index).to_string());
    }

    public static bool focus_window_or_monitor_up() {
      return send_act("FocusWindowOrMonitorUp");
    }

    public static bool focus_window_or_monitor_down() {
      return send_act("FocusWindowOrMonitorDown");
    }

    public static bool focus_column_or_monitor_left() {
      return send_act("FocusColumnOrMonitorLeft");
    }

    public static bool focus_column_or_monitor_right() {
      return send_act("FocusColumnOrMonitorRight");
    }

    public static bool focus_window_down() {
      return send_act("FocusWindowDown");
    }

    public static bool focus_window_up() {
      return send_act("FocusWindowUp");
    }

    public static bool focus_window_down_or_column_left() {
      return send_act("FocusWindowDownOrColumnLeft");
    }

    public static bool focus_window_down_or_column_right() {
      return send_act("FocusWindowDownOrColumnRight");
    }

    public static bool focus_window_up_or_column_left() {
      return send_act("FocusWindowUpOrColumnLeft");
    }

    public static bool focus_window_up_or_column_right() {
      return send_act("FocusWindowUpOrColumnRight");
    }

    public static bool focus_window_top() {
      return send_act("FocusWindowTop");
    }

    public static bool focus_window_bottom() {
      return send_act("FocusWindowBottom");
    }

    public static bool focus_window_down_or_top() {
      return send_act("FocusWindowDownOrTop");
    }

    public static bool focus_window_up_or_bottom() {
      return send_act("FocusWindowUpOrBottom");
    }

    public static bool move_column_left() {
      return send_act("MoveColumnLeft");
    }

    public static bool move_column_right() {
      return send_act("MoveColumnRight");
    }

    public static bool move_column_to_first() {
      return send_act("MoveColumnToFirst");
    }

    public static bool move_column_to_last() {
      return send_act("MoveColumnToLast");
    }

    public static bool move_column_left_or_to_monitor_left() {
      return send_act("MoveColumnLeftOrToMonitorLeft");
    }

    public static bool move_column_right_or_to_monitor_right() {
      return send_act("MoveColumnLeftOrToMonitorRight");
    }

    public static bool move_column_to_index(size_t index) {
      return send_act("MoveColumnToIndex", new Actions.MoveColumnToIndex(index).to_string());
    }

    public static bool move_window_down() {
      return send_act("MoveWindowDown");
    }

    public static bool move_window_up() {
      return send_act("MoveWindowUp");
    }

    public static bool move_window_down_or_to_workspace_down() {
      return send_act("MoveWindowDownOrToWorkspaceDown");
    }

    public static bool move_window_up_or_to_workspace_up() {
      return send_act("MoveWindowUpOrToWorkspaceUp");
    }

    public static bool consume_or_expel_window_left(uint64? id) {
      return send_act("ConsumeOrExpelWindowLeft", new Actions.ConsumeOrExpelWindowLeft(id).to_string());
    }

    public static bool consume_or_expel_window_right(uint64? id) {
      return send_act("ConsumeOrExpelWindowRight", new Actions.ConsumeOrExpelWindowRight(id).to_string());
    }

    public static bool consume_window_into_column() {
      return send_act("ConsumeWindowIntoColumn");
    }

    public static bool expel_window_from_column() {
      return send_act("ExpelWindowFromColumn");
    }

    public static bool swap_window_right() {
      return send_act("SwapWindowRight");
    }

    public static bool swap_window_left() {
      return send_act("SwapWindowLeft");
    }

    public static bool toggle_column_tabbed_display() {
      return send_act("ToggleColumnTabbedDisplay");
    }

    public static bool set_column_display(ActionFields.ColumnDisplayTag display) {
      return send_act("SetColumnDisplay", new Actions.SetColumnDisplay(display).to_string());
    }

    public static bool center_column() {
      return send_act("CenterColumn");
    }

    public static bool center_window(uint64? id) {
      return send_act("CenterWindow", new Actions.CenterWindow(id).to_string());
    }

    public static bool center_visible_columns() {
      return send_act("CenterVisibleColumns");
    }

    public static bool focus_workspace_down() {
      return send_act("FocusWorkspaceDown");
    }

    public static bool focus_workspace_up() {
      return send_act("FocusWorkspaceUp");
    }

    public static bool focus_workspace(ActionFields.WorkspaceReferenceArg reference) {
      return send_act("FocusWorkspace", new Actions.FocusWorkspace(reference).to_string());
    }

    public static bool focus_workspace_previous() {
      return send_act("FocusWorkspacePrevious");
    }

    public static bool move_window_to_workspace_down() {
      return send_act("MoveWindowToWorkspaceDown");
    }

    public static bool move_window_to_workspace_up() {
      return send_act("MoveWindowToWorkspaceUp");
    }

    public static bool move_window_to_workspace(uint64? window_id, ActionFields.WorkspaceReferenceArg reference, bool focus) {
      return send_act("MoveWindowToWorkspace", new Actions.MoveWindowToWorkspace(window_id, reference, focus).to_string());
    }

    public static bool move_column_to_workspace_down(bool focus) {
      return send_act("MoveColumnToWorkspaceDown", new Actions.MoveColumnToWorkspaceDown(focus).to_string());
    }

    public static bool move_column_to_workspace_up(bool focus) {
      return send_act("MoveColumnToWorkspaceUp", new Actions.MoveColumnToWorkspaceUp(focus).to_string());
    }

    public static bool move_column_to_workspace(ActionFields.WorkspaceReferenceArg reference, bool focus) {
      return send_act("MoveColumnToWorkspace", new Actions.MoveColumnToWorkspace(reference, focus).to_string());
    }

    public static bool move_workspace_down() {
      return send_act("MoveWorkspaceDown");
    }
    
    public static bool move_workspace_up() {
      return send_act("MoveWorkspaceUp");
    }

    public static bool move_workspace_to_index(size_t index, ActionFields.WorkspaceReferenceArg? reference) {
      return send_act("MoveWorkspaceToIndex", new Actions.MoveWorkspaceToIndex(index, reference).to_string());
    }

    public static bool set_workspace_name(string name, ActionFields.WorkspaceReferenceArg? workspace) {
      return send_act("SetWorkspaceName", new Actions.SetWorkspaceName(name, workspace).to_string());
    }

    public static bool unset_workspace_name(ActionFields.WorkspaceReferenceArg? workspace) {
      return send_act("UnsetWorkspaceName", new Actions.UnsetWorkspaceName(workspace).to_string());
    }

    public static bool focus_monitor_left() {
      return send_act("FocusMonitorLeft");
    }

    public static bool focus_monitor_right() {
      return send_act("FocusMonitorRight");
    }

    public static bool focus_monitor_down() {
      return send_act("FocusMonitorDown");
    }

    public static bool focus_monitor_up() {
      return send_act("FocusMonitorUp");
    }

    public static bool focus_monitor_previous() {
      return send_act("FocusMonitorPrevious");
    }

    public static bool focus_monitor_next() {
      return send_act("FocusMonitorNext");
    }

    public static bool focus_monitor(string output) {
      return send_act("FocusMonitor", new Actions.FocusMonitor(output).to_string());
    }

    public static bool move_window_to_monitor_left() {
      return send_act("MoveWindowToMonitorLeft");
    }
    
    public static bool move_window_to_monitor_right() {
      return send_act("MoveWindowToMonitorRight");
    }

    public static bool move_window_to_monitor_down() {
      return send_act("MoveWindowToMonitorDown");
    }

    public static bool move_window_to_monitor_up() {
      return send_act("MoveWindowToMonitorUp");
    }

    public static bool move_window_to_monitor(uint64? id, string output) {
      return send_act("MoveWindowToMonitor", new Actions.MoveWindowToMonitor(id, output).to_string());
    }

    public static bool move_column_to_monitor_left() {
      return send_act("MoveColumnToMonitorLeft");
    }

    public static bool move_column_to_monitor_right() {
      return send_act("MoveColumnToMonitorRight");
    }

    public static bool move_column_to_monitor_down() {
      return send_act("MoveColumnToMonitorDown");
    }

    public static bool move_column_to_monitor_up() {
      return send_act("MoveColumnToMonitorUp");
    }

    public static bool move_column_to_monitor_previous() {
      return send_act("MoveColumnToMonitorPrevious");
    }

    public static bool move_column_to_monitor_next() {
      return send_act("MoveColumnToMonitorNext");
    }

    public static bool move_column_to_monitor(string output) {
      return send_act("MoveColumnToMonitor", new Actions.MoveColumnToMonitor(output).to_string());
    }

    public static bool set_window_width(uint64? id, ActionFields.SizeChange change) {
      return send_act("SetWindowHeight", new Actions.SetWindowWidth(id, change).to_string());
    }

    public static bool set_window_height(uint64? id, ActionFields.SizeChange change) {
      return send_act("SetWindowHeight", new Actions.SetWindowHeight(id, change).to_string());
    }

    public static bool reset_window_height(uint64? id) {
      return send_act("ResetWindowHeight", new Actions.ResetWindowHeight(id).to_string());
    }

    public static bool switch_preset_column_width() {
      return send_act("SwitchPresetColumnWidth");
    }

    public static bool switch_preset_window_width(uint64? id) {
      return send_act("SwitchPresetWindowWidth", new Actions.SwitchPresetWindowWidth(id).to_string());
    }

    public static bool switch_preset_window_height(uint64? id) {
      return send_act("SwitchPresetWindowHeight", new Actions.SwitchPresetWindowHeight(id).to_string());
    }

    public static bool maximize_column() {
      return send_act("MaximizeColumn");
    }

    public static bool set_column_width(ActionFields.SizeChange change) {
      return send_act("SetColumnWidth", new Actions.SetColumnWidth(change).to_string());
    }

    public static bool expand_column_to_available_width() {
      return send_act("ExpandColumnToAvailableWidth");
    }

    public static bool switch_layout(ActionFields.LayoutSwitchTarget layout) {
      return send_act("SwitchLayout", new Actions.SwitchLayout(layout).to_string());
    }



    // TODO(2025-06-07, Max Bolotin): Continue here

    private static string fmt_str(string str) {
        return "\"%s\"\n".printf(str);
    }
    public string layers() {
      return send(fmt_str("Layers"));
    }
    public static async Window? pick_window() {
      var res = yield send_async(fmt_str("PickWindow"));
      if ("Ok" in res) {
        try {
          var json = Json.from_string(res).get_object();
          var window_json = json.get_object_member("Ok").get_object_member("PickedWindow");
          var window = Niri.get_default().get_window(window_json.get_int_member("id"));
          return window;
        } catch (Error err) {
          critical("command Error: %s", err.message);
        }
      }
      return null;
    }
    public static async double[]? pick_color() {
      var res = yield send_async(fmt_str("PickColor"));
      if ("Ok" in res) {
        try {
          var json = Json.from_string(res).get_object();
          var rgb = json.get_object_member("Ok").get_object_member("PickedColor").get_array_member("rgb");
          double r = rgb.get_double_element(0);
          double g = rgb.get_double_element(1);
          double b = rgb.get_double_element(2);
          double[] col = new double[3];
          col = {r, g, b};
          return col;
        } catch (Error err) {
          critical("command Error: %s", err.message);
        }
      }
      return null;
    }
}
}
