namespace AstalNiri {
  public class DTO : Object, Json.Serializable {
    public string to_string() {
      var json_node = Json.gobject_serialize(this);
      return Json.to_string(json_node, false);
    }
  }

  namespace Actions {
    public class Quit : DTO {
      public bool skip_confirmation;
      public Quit(bool skip_confirmation) { this.skip_confirmation = skip_confirmation; }
    }

    public class CenterWindow : DTO {
      public uint64? id;
      public CenterWindow(uint64? id) { this.id = id; }
    }

    public class FocusWorkspace : DTO {
      public ActionFields.WorkspaceReferenceArg reference;
      public FocusWorkspace(ActionFields.WorkspaceReferenceArg reference) { this.reference = reference; }
    }

    public class Spawn : DTO {
      public string[] command;
      public Spawn(string[] command) { this.command = command; }
    }

    public class DoScreenTransition : DTO {
      public uint16? delay_ms;
      public DoScreenTransition(uint16? delay_ms) { this.delay_ms = delay_ms; }
    }

    public class Screenshot : DTO {
      public bool show_pointer;
      public Screenshot(bool show_pointer) { this.show_pointer = show_pointer; }
    }

    public class ScreenshotScreen : DTO {
      public bool write_to_disk;
      public bool show_pointer;
      public ScreenshotScreen(bool write_to_disk, bool show_pointer) { this.write_to_disk = write_to_disk; this.show_pointer = show_pointer; }
    }

    public class ScreenshotWindow : DTO {
      public uint64? id;
      public bool write_to_disk;
      public ScreenshotWindow(uint64? id, bool write_to_disk) { this.id = id; this.write_to_disk = write_to_disk; }
    }

    public class CloseWindow : DTO {
      public uint64? id;
      public CloseWindow(uint64? id) { this.id = id; }
    }

    public class FullscreenWindow : DTO {
      public uint64? id;
      public FullscreenWindow(uint64? id) { this.id = id; }
    }

    public class ToggleWindowedFullscreen : DTO {
      public uint64? id;
      public ToggleWindowedFullscreen(uint64? id) { this.id = id; }
    }

    public class FocusWindow : DTO {
      public uint64 id;
      public FocusWindow(uint64 id) { this.id = id; }
    }

    public class FocusWindowInColumn : DTO {
      public uint8 index;
      public FocusWindowInColumn(uint8 index) { this.index = index; }
    }

    public class FocusColumn : DTO {
      public size_t index;
      public FocusColumn(size_t index) { this.index = index; }
    }

    public class MoveColumnToIndex : DTO {
      public size_t index;
      public MoveColumnToIndex(size_t index) { this.index = index; }
    }

    public class ConsumeOrExpelWindowLeft : DTO {
      public uint64? id;
      public ConsumeOrExpelWindowLeft(uint64? id) { this.id = id; }
    }

    public class ConsumeOrExpelWindowRight : DTO {
      public uint64? id;
      public ConsumeOrExpelWindowRight(uint64? id) { this.id = id; }
    }
    
    public class SetColumnDisplay : DTO {
      public ActionFields.ColumnDisplay display;
      public SetColumnDisplay(ActionFields.ColumnDisplay display) { this.display = display; }
    }

    public class MoveWindowToWorkspace : DTO {
      public uint64? window_id;
      public ActionFields.WorkspaceReferenceArg reference;
      public bool focus;
      public MoveWindowToWorkspace(uint64? window_id, ActionFields.WorkspaceReferenceArg reference, bool focus) { this.window_id = window_id; this.reference = reference; this.focus = focus; }
    }

    public class MoveColumnToWorkspaceDown : DTO {
      public bool focus;
      public MoveColumnToWorkspaceDown(bool focus) { this.focus = focus; }
    }

    public class MoveColumnToWorkspaceUp : DTO {
      public bool focus;
      public MoveColumnToWorkspaceUp(bool focus) { this.focus = focus; }
    }

    public class MoveColumnToWorkspace : DTO {
      public ActionFields.WorkspaceReferenceArg reference;
      public bool focus;
      public MoveColumnToWorkspace(ActionFields.WorkspaceReferenceArg reference, bool focus) { this.reference = reference; this.focus = focus; }
    }

    public class MoveWorkspaceToIndex : DTO {
      public size_t index;
      public ActionFields.WorkspaceReferenceArg? reference;
      public MoveWorkspaceToIndex(size_t index, ActionFields.WorkspaceReferenceArg? reference) { this.index = index; this.reference = reference; }
    }

    public class SetWorkspaceName : DTO {
      public string name;
      public ActionFields.WorkspaceReferenceArg? workspace;
      public SetWorkspaceName(string name, ActionFields.WorkspaceReferenceArg? workspace) { this.name = name; this.workspace; }
    }

    public class UnsetWorkspaceName : DTO {
      public ActionFields.WorkspaceReferenceArg? workspace;
      public UnsetWorkspaceName(ActionFields.WorkspaceReferenceArg? workspace) { this.workspace = workspace; }
    }

    public class FocusMonitor : DTO {
      public string output;
      public FocusMonitor(string output) { this.output = output; }
    }

    public class MoveWindowToMonitor : DTO {
      public uint64? id;
      public string output;
      public MoveWindowToMonitor(uint64? id, string output) { this.id = id; this.output = output; }
    }

    public class MoveColumnToMonitor : DTO {
      public string output;
      public MoveColumnToMonitor(string output) { this.output = output;}
    }

    public class SetWindowWidth : DTO {
      public uint64? id;
      public ActionFields.SizeChange change;
      public SetWindowWidth(uint64? id, ActionFields.SizeChange change) { this.id = id; this.change = change; }
    }

    public class SetWindowHeight : DTO {
      public uint64? id;
      public ActionFields.SizeChange change;
      public SetWindowHeight(uint64? id, ActionFields.SizeChange change) { this.id = id; this.change = change; }
    }

    public class ResetWindowHeight : DTO {
      public uint64? id;
      public ResetWindowHeight(uint64? id) { this.id = id; }
    }

    public class SwitchPresetWindowWidth : DTO {
      public uint64? id;
      public SwitchPresetWindowWidth(uint64? id) { this.id = id; }
    }

    public class SwitchPresetWindowHeight : DTO {
      public uint64? id;
      public SwitchPresetWindowHeight(uint64? id) { this.id = id; }
    }

    public class SetColumnWidth : DTO {
      public ActionFields.SizeChange change;
      public SetColumnWidth(ActionFields.SizeChange change) { this.change = change; }
    }

    public class SwitchLayout : DTO {
      public ActionFields.LayoutSwitchTarget layout;
      public SwitchLayout(ActionFields.LayoutSwitchTarget layout) { this.layout = layout; }
    }
  }

  namespace ActionFields {
    public struct WorkspaceReferenceArg {
      public uint64? Id;
      public uint8? Index;
      public string? Name;

      public WorkspaceReferenceArg.with_id(uint64 id) {
        Id = id;
      }

      public WorkspaceReferenceArg.with_index(uint8 index) {
        Index = index;
      }

      public WorkspaceReferenceArg.with_name(string name) {
        Name = name;
      }
    }
    
    public enum ColumnDisplay {
      Normal,
      Tabbed
    }

    public struct SizeChange {
      public int32? SetFixed;
      public double? SetProportion;
      public int32? AdjustFixed;
      public double? AdjustProportion;

      public SizeChange.with_set_fixed(int32? SetFixed) {
        this.SetFixed = SetFixed;
      }

      public SizeChange.with_set_proportion(double? SetProportion) {
        this.SetProportion = SetProportion;
      }
    }

    public class LayoutSwitchTarget : DTO {
      
    }
  }
}
