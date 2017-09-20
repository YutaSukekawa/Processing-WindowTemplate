/* 
 * ---------------------------------------
 * Window class : ウィンドウクラス
 * Created by YutaSukekawa August 20, 2017
 * ---------------------------------------
 */

import java.awt.Dimension;
import java.awt.Toolkit;

public static final String OS_TYPE = System.getProperty("os.name").toLowerCase();

/* Class on window : ウィンドウに関するクラス */
public class Window {
  
  /* Window type : ウィンドウのタイプ */
  public static final int SQUARE = 0;
  public static final int MOVIETONE = 1;
  public static final int LARGE_FORMAT = 2;
  public static final int STANDARD = 3;

  /* member variable : メンバ変数 */
  private int   screenWidth;
  private int   screenHeight;
  private float windowWidth;
  private float windowHeight;
  private int   windowLocationX;
  private int   windowLocationY;
  private int   tmpWidth;
  private int   tmpHeight;
  //private String osType = System.getProperty("os.name").toLowerCase();
  
  /* Default constructor : デフォルトのコンストラクタ */
  public Window() {
    
    setWidnowStatus(1.8f, 4, 3);
      
  }
  
  /* Specify by string : ウィンドウの種類を文字列で指定する */
  public Window(int windowRatioStr) {
    
    /* width and height ratio : 縦横比率 */
    int wr = 0, hr = 0;
    
    switch(windowRatioStr) {
    
      case SQUARE:
        wr = 1;
        hr = 1;
        break;
      
      case MOVIETONE:
        wr = 6;
        hr = 5;
        break;
        
      case LARGE_FORMAT:
        wr = 5;
        hr = 4;
        break;
        
      case STANDARD:
        wr = 4;
        hr = 3;
        break;
        
      default:
        wr = 4;
        hr = 3;
        break;
    
    }
    
    setWidnowStatus(1.8f, wr, hr);
      
  }
  
  /* Specify by value : 値を渡して指定する */
  public Window(float correctionFactor, int wr, int hr) {
  
    setWidnowStatus(correctionFactor, wr, hr);
  
  }
  
  private void setWidnowStatus(float correctionFactor, int wr, int hr) {
  
    /* Get screen size : スクリーンサイズを取得 */
    Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    
    /** 縦横のウィンドウサイズを代入 */
    windowWidth = screenWidth / correctionFactor;
    windowHeight = screenHeight / correctionFactor;
    
    /** スクリーンサイズ算出 */
    /** どんなディスプレイでも比率を動的に変化させる */
    for(int i = hr; tmpHeight < windowHeight; i += hr) {
      tmpHeight = i * 32;
    }
    tmpWidth = ((tmpHeight / 32 / hr) * wr) * 32;
    
    /* Substitute window values : ウィンドウ関連の変数に値を代入 */
    windowWidth = tmpWidth;
    windowHeight = tmpHeight;
    
    windowLocationX = (screenWidth - (int)windowWidth) / 2;
    windowLocationY = (screenHeight - (int)windowHeight) / 2;
    
  }
  
  /* Set application window : ウィンドウをセット */
  public void setWindow() {
    
    surface.setTitle("SAGA Revive");
    
    /* : OS が Linux の場合は，別途処理を行う */
    if(OS_TYPE.equals("linux")) {
      surface.setSize(getWindowWidth(), getWindowHeight());  // 画面サイズ設定
    }
    /* OS が Linux 以外の場合 */
    else {
      surface.setSize(getWindowWidth(), getWindowHeight());  // 画面サイズ設定
      surface.setLocation(windowLocationX, windowLocationY);
    }
    
  }
  
  /* Getter : ゲッター */
  /* Get window width : ウィンドウの横幅を取得 */
  public int getWindowWidth() {
    return (int)this.windowWidth;
  }
  
  /* Get window height : ウィンドウの高さを取得 */
  public int getWindowHeight() {
    return (int)this.windowHeight;
  }
  
  /* Get location x of window : ウィンドウの x 座標を取得 */
  public int getWindowLocationX() {
    return this.windowLocationX;
  }
  
  /* Get location y of window : ウィンドウの y 座標を取得 */
  public int getWindowLocationY() {
    return this.windowLocationY;
  }
  
}