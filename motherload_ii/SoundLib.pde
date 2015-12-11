import javax.sound.sampled.*;
import javax.sound.sampled.LineEvent.Type;

class SoundPlayer {
  
  //Class variables
  File soundFile;
  AsyncSoundPlayer asp;
  Thread thread;
  
  //Constructor
  SoundPlayer(String fileName){
    try {
      this.soundFile = new File(fileName);
    }catch (Exception ex){
      print("Failed to load sound\n");
      print(ex + "\n");
    }
  }
  
  void playSound() {
    this.asp = new AsyncSoundPlayer(this.soundFile); //Create a runnable, so we can access later
    this.thread = new Thread(asp);
    this.thread.start();
  }
}

class AsyncSoundPlayer implements Runnable {
  File soundFile;
  AsyncSoundPlayer(File soundFile){
    this.soundFile = soundFile;
  }
  
  void run(){
    try {
      AudioListener listener = new AudioListener();
      AudioInputStream audioInputStream = AudioSystem.getAudioInputStream(this.soundFile);
      try {
        Clip clip = AudioSystem.getClip();
        clip.addLineListener(listener);
        clip.open(audioInputStream);
        try {
          clip.start();
          listener.waitUntilDone();
        } finally {
          clip.close();
        }
      } finally {
        audioInputStream.close();
      }
    } catch (Exception ex){
      //print(ex);
    }
  }
}


class AudioListener implements LineListener {
  private boolean done = false;
  @Override public synchronized void update(LineEvent event) {
    Type eventType = event.getType();
    if (eventType == Type.STOP || eventType == Type.CLOSE) {
      done = true;
      notifyAll();
    }
  }
  public synchronized void waitUntilDone() throws InterruptedException {
    while (!done) {
      wait();
    }
  }
}