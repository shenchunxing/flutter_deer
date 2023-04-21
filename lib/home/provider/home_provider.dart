
import 'package:flutter/material.dart';
/*RestorableInt： 临时状态存储，为了不频繁的build*/
class HomeProvider extends RestorableInt {
  HomeProvider() : super(0);
}
