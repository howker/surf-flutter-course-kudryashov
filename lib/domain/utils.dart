import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

List<Sight> listAreaByRadius(
    List<Sight> inputList, userLat, userLng, RangeValues rangeValues) {
  List<Sight> listAreaByRadius = [];
  inputList.forEach((element) {
    if (arePointsNear(userLat, userLng, element.lat, element.lon,
        rangeValues.start, rangeValues.end)) listAreaByRadius.add(element);
  });
  return listAreaByRadius;
}

bool arePointsNear(
    userPointLat, userPointLng, checkPointLat, checkPointLng, kmStart, kmEnd) {
  const double pi = 3.1415926535897932;
  const ky = 40000 / 360;
  double kx = cos(pi * userPointLat / 180.0) * ky;
  var dx = (userPointLng - checkPointLng).abs() * kx;
  var dy = (userPointLat - checkPointLat).abs() * ky;
  if (sqrt(dx * dx + dy * dy) <= kmEnd * 0.001 &&
      sqrt(dx * dx + dy * dy) >= kmStart * 0.001)
    return true;
  else
    return false;
}
