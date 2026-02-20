import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.fieldTitle,
    required this.textEditingController,
    this.icon,
    this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.fillColor,
    this.hasError = false,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.onTap,
    this.textInputAction,
    this.onSubmitted,
    this.validator,
    this.autofillHints,
    this.enabled = true,
    this.autovalidateMode,
    this.focusNode,
  });

  final String fieldTitle;
  final TextEditingController textEditingController;
  final Widget? icon;
  final String? hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final Color? fillColor;
  final bool hasError;
  final int maxLines;
  final int? minLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final Iterable<String>? autofillHints;
  final bool enabled;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late final FocusNode _focusNode;
  late final bool _ownsFocusNode;
  late final ValueNotifier<bool> _hasFocus;

  @override
  void initState() {
    super.initState();

    _ownsFocusNode = widget.focusNode == null;
    _focusNode = widget.focusNode ?? FocusNode();

    _hasFocus = ValueNotifier<bool>(_focusNode.hasFocus);
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    _hasFocus.value = _focusNode.hasFocus;
  }

  void _handleTapAnywhere() {
    // keep existing behavior
    widget.onTap?.call();

    // only request focus if it’s editable/enabled
    if (!widget.enabled) return;
    if (widget.readOnly) return;

    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _hasFocus.dispose();
    if (_ownsFocusNode) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppDimensions.radius12);
    final merged = Listenable.merge([_hasFocus, widget.textEditingController]);

    return AnimatedBuilder(
      animation: merged,
      builder: (context, _) {
        final hasFocus = _hasFocus.value;
        final text = widget.textEditingController.text;
        final hasText = text.trim().isNotEmpty;
        final isFloating = hasFocus || hasText;

        final bgColor = widget.fillColor ?? AppColors.white;

        return GestureDetector(
          behavior: HitTestBehavior.translucent, // ✅ taps anywhere
          onTap: _handleTapAnywhere,
          child: Container(
            decoration: BoxDecoration(
              color: widget.enabled ? bgColor : bgColor.withOpacity(0.75),
              borderRadius: borderRadius,
              border: Border.all(
                color: widget.hasError ? Colors.red : Colors.transparent,
                width: widget.hasError ? 1.2 : 0,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 22,
                    right: widget.icon != null ? 54 : 22,
                    top: isFloating ? 30 : 18,
                    bottom: 16,
                  ),
                  child: TextFormField(
                    controller: widget.textEditingController,
                    focusNode: _focusNode,
                    enabled: widget.enabled,
                    obscureText: widget.obscureText,
                    keyboardType: widget.keyboardType,
                    readOnly: widget.readOnly,
                    // ✅ keep normal tap too, but the whole widget is tappable now
                    onTap: () {
                      widget.onTap?.call();
                    },
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    textInputAction: widget.textInputAction,
                    onFieldSubmitted: widget.onSubmitted,
                    validator: widget.validator,
                    autofillHints: widget.autofillHints,
                    autovalidateMode: widget.autovalidateMode,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: widget.enabled
                          ? AppColors.black
                          : AppColors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: widget.onChanged,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 160),
                  curve: Curves.easeOut,
                  left: 22,
                  top: isFloating ? 12 : 18,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 160),
                    curve: Curves.easeOut,
                    style: isFloating
                        ? AppTextStyles.bodySmall.copyWith(
                            color: AppColors.maincolor3.withOpacity(0.75),
                            fontWeight: FontWeight.w500,
                          )
                        : AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                    child: Text(widget.fieldTitle),
                  ),
                ),

                if (!isFloating && (widget.hintText ?? '').isNotEmpty)
                  Positioned(
                    left: 22,
                    top: 44,
                    child: Text(
                      widget.hintText!,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.maincolor3.withOpacity(0.45),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                if (widget.icon != null)
                  Positioned(
                    right: 14,
                    top: 10,
                    bottom: 10,
                    child: Center(
                      // ✅ Keep icon clickable if it's a button
                      child: widget.icon!,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
