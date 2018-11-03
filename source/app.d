import std.stdio;
import std.format;

import gtk.Application : Application;
import gio.Application : GioApplication = Application;
import gtk.ApplicationWindow : ApplicationWindow;
import gtkc.giotypes : GApplicationFlags;

import gtk.HeaderBar;
import gtk.Label;

class MainWindow : ApplicationWindow {
  this(Application application) {
    super(application);
    initUI();
    showAll();
  }

private void initUI() {
    this.setSizeRequest(1024, 640);

    //Titlebar
    HeaderBar hb = new HeaderBar();
    hb.setShowCloseButton(true);
    hb.setTitle("Welcome");
    this.setTitlebar(hb);

    //Title
		Label title = new Label("<span size=\"x-large\" weight=\"heavy\">I Love OS</span>");
    title.setUseMarkup(true);
    add(title);
  }
}

int main(string[] args) {
    auto application = new Application("love.os.greeter", GApplicationFlags.FLAGS_NONE);
    application.addOnActivate(delegate void(GioApplication app) { MainWindow mainWindow = new MainWindow(application); });
    return application.run(args);
}
