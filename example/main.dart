import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_collection_sampler/dart_collection_sampler.dart';

void main(List<String> arguments) {
  var argParser = ArgParser()
    ..addOption("num",
        abbr: "n",
        help: "items to pick from rest of command line",
        defaultsTo: "1")
    ..addFlag("unique",
        abbr: "u",
        help: "select unique results",
        defaultsTo: false,
        negatable: false);

  var results = argParser.parse(arguments);

  exit(deal(int.parse(results["num"]), results.rest, results['unique']));
}

int deal(int n, List<String> items, bool unique) {
  if (items.isEmpty) {
    print("you must supply one or more items as input");
    return 1;
  }
  print("Picking $n from $items (unique: $unique)\n");

  if (n == 1) {
    print("Selected item: ${CollectionSampler().pick(items)}");
  } else {
    print(
        "Selected items: ${CollectionSampler().pickN(items, n, unique: unique)}");
  }
  return 0;
}
