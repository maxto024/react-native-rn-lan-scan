
package com.rnlanscan;

import android.content.Context;
import android.widget.Toast;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class RNRnLanScanModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNRnLanScanModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }


  @ReactMethod
  public void show(String text) {
    Context context = getReactApplicationContext();
    Toast.makeText(context, text, Toast.LENGTH_LONG).show();
  }

  @Override
  public String getName() {
    return "RNRnLanScan";
  }
}