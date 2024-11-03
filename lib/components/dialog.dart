import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:panely/controller.dart';
import 'package:panely/components/buttons.dart';

enum PanelyDialogType {
  custom,
  info,
  confirmation;
}

class PanelyDialog {
  BuildContext context;

  PanelyDialog({
    required this.context,
  });

  Future<T?> showConfirmation<T>({
    required String title,
    required String description,
    List<PanelyButton>? actions,
    Size? size,
  }) {
    final theme = GetIt.I<PanelyController>().theme;
    return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: theme.dialog.backgroundColor,
                border: Border.all(
                  color: theme.borderColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15)),
            width: size?.width ?? 350,
            height: size?.height ?? 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.dialog.headerTextStyle,
                      ),
                      Text(
                        description,
                        style: theme.dialog.descriptionTextStyle,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    theme.dialog.divider,
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actions ??
                            [
                              PanelyButton(
                                type: PanelyButtonType.secondary,
                                label: "Close",
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<T?> showCustom<T>({
    required String title,
    required Widget child,
    List<PanelyButton>? actions,
    Size? size,
  }) {
    final theme = GetIt.I<PanelyController>().theme;
    return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: theme.dialog.backgroundColor,
                border: Border.all(
                  color: theme.borderColor,
                ),
                borderRadius: BorderRadius.circular(15)),
            width: size?.width,
            height: size?.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        title,
                        style: theme.dialog.headerTextStyle,
                      ),
                    ),
                    theme.dialog.divider,
                  ],
                ),
                child,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    theme.dialog.divider,
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: actions ??
                            [
                              PanelyButton(
                                type: PanelyButtonType.secondary,
                                label: "Close",
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
