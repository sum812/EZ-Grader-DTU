import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

Link buildLink(Uri url, String buttonText) {
  return Link(
    uri: url,
    target: LinkTarget.defaultTarget,
    builder: (context, openLink) => TextButton(
      onPressed: openLink,
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}