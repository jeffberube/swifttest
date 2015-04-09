//
//  AppDelegate.swift
//  swifttest
//
//  Created by Jean-Francois Berube on 2015-04-08.
//  Copyright (c) 2015 Nordiq Digital. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var container: NSView!
    @IBOutlet weak var tf: NSTextField!
    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var redSlider: NSSlider!
    @IBOutlet weak var greenSlider: NSSlider!
    @IBOutlet weak var blueSlider: NSSlider!
    @IBOutlet weak var popupButton: NSPopUpButton!
    
    var backgroundColor = RGBColor(red: 255, green: 255, blue: 255);
    
    @IBAction func buttonPress(sender: NSButton) {
        label.stringValue = tf.stringValue;
    }
    
    @IBAction func popupChange(sender: NSPopUpButton) {
        label.stringValue = popupButton.selectedItem!.title;
    }

    @IBAction func redChange(sender: NSSlider) {
        changeBackgroundColor()
    }
    
    @IBAction func greenChange(sender: NSSlider) {
        changeBackgroundColor()
    }
    
    @IBAction func blueChange(sender: NSSlider) {
        changeBackgroundColor()
    }
    
    func changeBackgroundColor() {
        window.backgroundColor = NSColor(red: CGFloat(redSlider.floatValue), green: CGFloat(greenSlider.floatValue), blue: CGFloat(blueSlider.floatValue), alpha: 1.0);
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your applicationr
        redSlider.maxValue = 1.0
        greenSlider.maxValue = 1.0
        blueSlider.maxValue = 1.0
        
        //var whitebg = CALayer();
        //whitebg.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0]);
        
        container.wantsLayer = true;
        container.layer!.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0]);
        
        redSlider.floatValue = 0.5;
        greenSlider.floatValue = 0.5;
        blueSlider.floatValue = 0.5;
        changeBackgroundColor();
        
        //redSlider.setCell(RedSlider());
        //greenSlider.setCell(GreenSlider());
        //blueSlider.setCell(BlueSlider());
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


    class RedSlider: NSSliderCell {
        override func drawBarInside(aRect: NSRect, flipped: Bool) {
            NSColor.redColor().set();
            NSRectFill(aRect);
        }
    }
    
    class GreenSlider: NSSliderCell {
        override func drawBarInside(aRect: NSRect, flipped: Bool) {
            NSColor.greenColor().set();
            NSRectFill(aRect);
        }
    }
    
    class BlueSlider: NSSliderCell {
        override func drawBarInside(aRect: NSRect, flipped: Bool) {
            NSColor.blueColor().set();
            NSRectFill(aRect);
        }
    }
    
    
}

