namespace AstalNiri {
  public class DTO : Object, Json.Serializable {
    public string to_string() {
      var json_node = Json.gobject_serialize(this);
      return Json.to_string(json_node, false);
    }
  }

  namespace Actions {
    public class Quit : DTO {
      public bool skip_confirmation {get; set;}
      public Quit(bool skip_confirmation) { this.skip_confirmation = skip_confirmation; }
    }

    public class CenterWindow : DTO {
      public uint64? id {get; set;}
      public CenterWindow(uint64? id) { this.id = id; }
    }

    public class FocusWorkspace : DTO {
      public ActionFields.WorkspaceReferenceArg reference {get; set;}
      public FocusWorkspace(ActionFields.WorkspaceReferenceArg reference) { this.reference = reference; }
    }

    public class Spawn : DTO {
      public string[] command {get; set;}
      public Spawn(string[] command) { this.command = command; }
    }

    public class DoScreenTransition : DTO {
      public uint16? delay_ms {get; set;}
      public DoScreenTransition(uint16? delay_ms) { this.delay_ms = delay_ms; }
    }

    public class Screenshot : DTO {
      public bool show_pointer {get; set;}
      public Screenshot(bool show_pointer) { this.show_pointer = show_pointer; }
    }

    public class ScreenshotScreen : DTO {
      public bool write_to_disk {get; set;}
      public bool show_pointer {get; set;}
      public ScreenshotScreen(bool write_to_disk, bool show_pointer) { this.write_to_disk = write_to_disk; this.show_pointer = show_pointer; }
    }

    public class ScreenshotWindow : DTO {
      public uint64? id {get; set;}
      public bool write_to_disk {get; set;}
      public ScreenshotWindow(uint64? id, bool write_to_disk) { this.id = id; this.write_to_disk = write_to_disk; }
    }

    public class CloseWindow : DTO {
      public uint64? id {get; set;}
      public CloseWindow(uint64? id) { this.id = id; }
    }

    public class FullscreenWindow : DTO {
      public uint64? id {get; set;}
      public FullscreenWindow(uint64? id) { this.id = id; }
    }

    public class ToggleWindowedFullscreen : DTO {
      public uint64? id {get; set;}
      public ToggleWindowedFullscreen(uint64? id) { this.id = id; }
    }

    public class FocusWindow : DTO {
      public uint64 id {get; set;}
      public FocusWindow(uint64 id) { this.id = id; }
    }

    public class FocusWindowInColumn : DTO {
      public uint8 index {get; set;}
      public FocusWindowInColumn(uint8 index) { this.index = index; }
    }

    public class FocusColumn : DTO {
      public size_t index {get; set;}
      public FocusColumn(size_t index) { this.index = index; }
    }

    public class MoveColumnToIndex : DTO {
      public size_t index {get; set;}
      public MoveColumnToIndex(size_t index) { this.index = index; }
    }

    public class ConsumeOrExpelWindowLeft : DTO {
      public uint64? id {get; set;}
      public ConsumeOrExpelWindowLeft(uint64? id) { this.id = id; }
    }

    public class ConsumeOrExpelWindowRight : DTO {
      public uint64? id {get; set;}
      public ConsumeOrExpelWindowRight(uint64? id) { this.id = id; }
    }
    
    public class SetColumnDisplay : DTO {
      public ActionFields.ColumnDisplay display {get; set;}
      public SetColumnDisplay(ActionFields.ColumnDisplayTag display) { this.display = ActionFields.ColumnDisplay(display); }
    }

    public class MoveWindowToWorkspace : DTO {
      public uint64? window_id {get; set;}
      public ActionFields.WorkspaceReferenceArg reference {get; set;}
      public bool focus {get; set;}
      public MoveWindowToWorkspace(uint64? window_id, ActionFields.WorkspaceReferenceArg reference, bool focus) { this.window_id = window_id; this.reference = reference; this.focus = focus; }
    }

    public class MoveColumnToWorkspaceDown : DTO {
      public bool focus {get; set;}
      public MoveColumnToWorkspaceDown(bool focus) { this.focus = focus; }
    }

    public class MoveColumnToWorkspaceUp : DTO {
      public bool focus {get; set;}
      public MoveColumnToWorkspaceUp(bool focus) { this.focus = focus; }
    }

    public class MoveColumnToWorkspace : DTO {
      public ActionFields.WorkspaceReferenceArg reference {get; set;}
      public bool focus {get; set;}
      public MoveColumnToWorkspace(ActionFields.WorkspaceReferenceArg reference, bool focus) { this.reference = reference; this.focus = focus; }
    }

    public class MoveWorkspaceToIndex : DTO {
      public size_t index {get; set;}
      public ActionFields.WorkspaceReferenceArg? reference {get; set;}
      public MoveWorkspaceToIndex(size_t index, ActionFields.WorkspaceReferenceArg? reference) { this.index = index; this.reference = reference; }
    }

    public class SetWorkspaceName : DTO {
      public string name {get; set;}
      public ActionFields.WorkspaceReferenceArg? workspace {get; set;}
      public SetWorkspaceName(string name, ActionFields.WorkspaceReferenceArg? workspace) { this.name = name; this.workspace; }
    }

    public class UnsetWorkspaceName : DTO {
      public ActionFields.WorkspaceReferenceArg? workspace {get; set;}
      public UnsetWorkspaceName(ActionFields.WorkspaceReferenceArg? workspace) { this.workspace = workspace; }
    }

    public class FocusMonitor : DTO {
      public string output {get; set;}
      public FocusMonitor(string output) { this.output = output; }
    }

    public class MoveWindowToMonitor : DTO {
      public uint64? id {get; set;}
      public string output {get; set;}
      public MoveWindowToMonitor(uint64? id, string output) { this.id = id; this.output = output; }
    }

    public class MoveColumnToMonitor : DTO {
      public string output {get; set;}
      public MoveColumnToMonitor(string output) { this.output = output;}
    }

    public class SetWindowWidth : DTO {
      public uint64? id {get; set;}
      public ActionFields.SizeChange change {get; set;}
      public SetWindowWidth(uint64? id, ActionFields.SizeChange change) { this.id = id; this.change = change; }
    }

    public class SetWindowHeight : DTO {
      public uint64? id {get; set;}
      public ActionFields.SizeChange change {get; set;}
      public SetWindowHeight(uint64? id, ActionFields.SizeChange change) { this.id = id; this.change = change; }
    }

    public class ResetWindowHeight : DTO {
      public uint64? id {get; set;}
      public ResetWindowHeight(uint64? id) { this.id = id; }
    }

    public class SwitchPresetWindowWidth : DTO {
      public uint64? id {get; set;}
      public SwitchPresetWindowWidth(uint64? id) { this.id = id; }
    }

    public class SwitchPresetWindowHeight : DTO {
      public uint64? id {get; set;}
      public SwitchPresetWindowHeight(uint64? id) { this.id = id; }
    }

    public class SetColumnWidth : DTO {
      public ActionFields.SizeChange change {get; set;}
      public SetColumnWidth(ActionFields.SizeChange change) { this.change = change; }
    }

    public class SwitchLayout : DTO {
      public ActionFields.LayoutSwitchTarget layout {get; set;}
      public SwitchLayout(ActionFields.LayoutSwitchTarget layout) { this.layout = layout; }
    }
  }

  namespace ActionFields {
    public static bool registered_serialize_funcs = false;

    public static void register_serialize_funcs() {
      if (!registered_serialize_funcs) {
        Json.boxed_register_serialize_func(typeof(WorkspaceReferenceArg), Json.NodeType.OBJECT, WorkspaceReferenceArg.serialize_json);
        Json.boxed_register_serialize_func(typeof(ColumnDisplay), Json.NodeType.VALUE, ColumnDisplay.serialize_json);
        Json.boxed_register_serialize_func(typeof(SizeChange), Json.NodeType.VALUE, SizeChange.serialize_json);
        Json.boxed_register_serialize_func(typeof(LayoutSwitchTarget), Json.NodeType.VALUE, LayoutSwitchTarget.serialize_json);
        registered_serialize_funcs = true;
      }
    }

    public struct WorkspaceReferenceArg {
      public WorkspaceReferenceArgTag tag {get; set;}
      public void* value {get; set;}

      public WorkspaceReferenceArg.id(uint64* id) {
        this.tag = WorkspaceReferenceArgTag.Id;
        this.value = id;
      }

      public WorkspaceReferenceArg.index(uint8* index) {
        this.tag = WorkspaceReferenceArgTag.Index;
        this.value = index;
      }

      public WorkspaceReferenceArg.name(string name) {
        this.tag = WorkspaceReferenceArgTag.Name;
        this.value = name;
      }

      public static Json.Node serialize_json(void* _boxed) {
        assert(_boxed != null);
        WorkspaceReferenceArg* boxed = (WorkspaceReferenceArg*) _boxed;

        var node = new Json.Node(Json.NodeType.OBJECT);
        var obj = new Json.Object();
        switch (boxed.tag) {
          case WorkspaceReferenceArgTag.Index:
            obj.set_int_member("Index", *((uint8*)boxed.value));
            break;
          case WorkspaceReferenceArgTag.Id:
            obj.set_int_member("Id", (int64)(*((uint64*)boxed.value)));
            break;
          case WorkspaceReferenceArgTag.Name:
            obj.set_string_member("Name", (string)boxed.value);
            break;
        }
        node.set_object(obj);

        return node;
      }
    }

    public enum WorkspaceReferenceArgTag {
      Id,
      Index,
      Name,
    }

    public struct ColumnDisplay {
      public ColumnDisplayTag tag {get; set;}
      public ColumnDisplay(ColumnDisplayTag tag) { this.tag = tag; }
      public ColumnDisplay.normal() { ColumnDisplay(ColumnDisplayTag.Normal); }
      public ColumnDisplay.tabbed() { ColumnDisplay(ColumnDisplayTag.Tabbed); }
      public static Json.Node serialize_json(void* _boxed) {
        assert(_boxed != null);
        ColumnDisplay* boxed = (ColumnDisplay*) _boxed;
        var node = new Json.Node(Json.NodeType.VALUE);
        switch (boxed.tag) {
          case ColumnDisplayTag.Normal:
            node.set_string("Normal");
            break;
          case ColumnDisplayTag.Tabbed:
            node.set_string("Tabbed");
            break;
        }
        return node;
      }
    }

    public enum ColumnDisplayTag {
      Normal,
      Tabbed
    }

    public struct SizeChange {
      public SizeChangeTag tag {get; set;}
      public void* value {get; set;}

      public SizeChange.set_fixed(int64* fixed) {
        this.tag = SizeChangeTag.SetFixed;
        this.value = fixed;
      }

      public SizeChange.set_proportion(double* proportion) {
        this.tag = SizeChangeTag.SetProportion;
        this.value = proportion;
      }

      public SizeChange.adjust_fixed(int64* fixed) {
        this.tag = SizeChangeTag.AdjustFixed;
        this.value = fixed;
      }

      public SizeChange.adjust_proportion(double* proportion) {
        this.tag = SizeChangeTag.AdjustProportion;
        this.value = proportion;
      }

      public static Json.Node serialize_json(void *_boxed) {
        assert(_boxed != null);
        var boxed = (SizeChange*)_boxed;
        var node = new Json.Node(Json.NodeType.OBJECT);
        var object = new Json.Object();
        switch (boxed.tag) {
          case SizeChangeTag.SetFixed: {
            object.set_int_member("SetFixed", *((int64*)boxed.value));
            break;
          }
          case SizeChangeTag.SetProportion: {
            object.set_double_member("SetProportion", *((double*)boxed.value));
            break;
          }
          case SizeChangeTag.AdjustFixed: {
            object.set_int_member("AdjustFixed", *((int64*)boxed.value));
            break;
          }
          case SizeChangeTag.AdjustProportion: {
            object.set_double_member("AdjustProportion", *((double*)boxed.value));
            break;
          }
        }
        node.set_object(object);
        return node;
      }
    }

    public enum SizeChangeTag {
      SetFixed,
      SetProportion,
      AdjustFixed,
      AdjustProportion,
    }

    public struct LayoutSwitchTarget {
      public LayoutSwitchTargetTag tag {get; set;}
      public uint8 index_value {get; set;}

      public LayoutSwitchTarget(LayoutSwitchTargetTag tag) {
        this.tag = tag;
      }

      public LayoutSwitchTarget.next() {
        this(LayoutSwitchTargetTag.Next);
      }

      public LayoutSwitchTarget.prev() {
        this(LayoutSwitchTargetTag.Prev);
      }

      public LayoutSwitchTarget.index(uint8 index) {
        this(LayoutSwitchTargetTag.Index);
        this.index_value = index;
      }

      public static Json.Node serialize_json(void *_boxed) {
        assert(_boxed != null);
        LayoutSwitchTarget* boxed = (LayoutSwitchTarget*)_boxed;
        var node = new Json.Node(Json.NodeType.VALUE);
        switch (boxed.tag) {
          case LayoutSwitchTargetTag.Next:
            node.set_string("Next");
          break;
          case LayoutSwitchTargetTag.Prev:
            node.set_string("Prev");
          break;
          case LayoutSwitchTargetTag.Index:
            var n = new Json.Node(Json.NodeType.OBJECT);
            var obj = new Json.Object();
            obj.set_int_member("Index", boxed.index_value);
            n.set_object(obj);
            return n;
        }
        return node;
      }
    }

    public enum LayoutSwitchTargetTag {
      Next,
      Prev,
      Index,
    }
  }
}
