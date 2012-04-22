/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package fr.inria.papart.multitouchKinect;

/**
 *
 * @author jeremy
 */

public class TouchPointTracker implements Comparable<TouchPointTracker>{
  TouchPoint oldTp;
  TouchPoint newTp;
  float distance;
 

  public TouchPointTracker(TouchPoint oldTp, TouchPoint newTp) {
    this.oldTp = oldTp;
    this.newTp = newTp;
    distance = oldTp.getPosition().distanceTo(newTp.getPosition());
  }

  public TouchPoint getOld(){
    return oldTp;
  }

  public TouchPoint getNew(){
    return newTp;
  }

  public boolean update(int currentTime){
    return oldTp.updateWith(newTp, currentTime);
//    newTp.id = oldTp.id;
  }

  public int compareTo(TouchPointTracker tpt){
    return Float.compare(distance, tpt.distance);
  }

    @Override
  public String toString(){
    return "TouchPointTracker : \n " + getOld() + "\n"+ getNew() + " \nDistance " + distance + " \n";
  }

}

