import std.stdio;
import std.format;
import core.stdc.stdlib;

import gtk.Application : Application;
import gio.Application : GioApplication = Application;
import gtk.ApplicationWindow : ApplicationWindow;
import gtkc.giotypes : GApplicationFlags;
import gtk.Builder;
import gtk.Button;
import gtk.Window;

import gtk.HeaderBar;
import gtk.Label;

immutable string GLADE_MAIN = "source/ui/main.glade";

int main(string[] args) {
  auto application = new Application("love.os.greeter", GApplicationFlags.FLAGS_NONE);

  void mainPage(GioApplication a) {
    auto builder = new Builder();
    if (!builder.addFromFile(GLADE_MAIN)) {
      writeln("File does not exist.");
      exit(1);
    }
    auto window = cast(ApplicationWindow)builder.getObject("window");
    window.setApplication(application);
    if (window !is null) {
      window.setTitle("Welcome!");
    } else {
      writeln("No love from gtk ;(");
      exit(1);
    }
	}

application.addOnActivate(&mainPage);
  return application.run(args);
}
