
var target = UIATarget.localTarget();

UIALogger.logDebug("start Movedocument.js");
/// start move to first letter in list
target.pushTimeout(30)
target.frontMostApp().mainWindow().tableViews()[0].cells()[0].tap();
target.popTimeout()
target.delay(1);
target.frontMostApp().mainWindow().tableViews()[0].cells()[0].tap();
target.delay(1);
target.frontMostApp().mainWindow().tableViews()[0].cells()[0].tap();
target.delay(1);


// End move to first letter in list
// start Move letter

target.delay(4);
if (target.frontMostApp().toolbar().buttons()[0].checkIsValid()) {
target.frontMostApp().toolbar().buttons()[0].tap();
} else {
    if (target.frontMostApp().toolbar().buttons()["Move"].checkIsValid()){
        target.frontMostApp().toolbar().buttons()["Move"].tap();
    }
}
UIATarget.localTarget().delay(2);
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.34, y:0.81}});


UIATarget.localTarget().delay(1);
target.frontMostApp().navigationBar().leftButton().tap();
UIATarget.localTarget().delay(1);

target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.37, y:0.39}});
UIATarget.localTarget().delay(1);
target.frontMostApp().mainWindow().tableViews()[0].cells()[0].tap();
target.frontMostApp().toolbar().buttons()[0].tap();
target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.28, y:0.79}});



target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().navigationBar().leftButton().tap();

