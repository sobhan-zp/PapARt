/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package multitouch.laviole.name;

import toxi.geom.Vec3D;

/**
 *
 * @author jeremy
 */
public class Img3DVec{
  public Vec3D vec;
  public int offset;

  public Img3DVec(Vec3D vec, int offset){
    this.vec = vec;
    this.offset = offset;
  }

  public int X(){
    return offset % MyApplet.w;
  }

  public int Y(){
    return offset / MyApplet.w;
  }
}