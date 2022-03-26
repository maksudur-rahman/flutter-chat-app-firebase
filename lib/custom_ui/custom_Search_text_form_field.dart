import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchTextFormField extends StatefulWidget {
  final String? label;
  final Color? color;
  final Color fillColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FocusNode? focusTo;
  final Function? validator;
  final Function? onSaved;
  final TextInputType? inputType;
  final int? maxLine;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final bool isPasswordField;
  final bool readOnly;
  final Icon? suffixIcon;
  final String? suffixText;
  final Icon? prefixIcon;
  final String? hint;
  bool _showPassword = false;
  bool isEnabled;
  String? initialText;
  final List<TextInputFormatter>? textinputFormatters;
  final Function? onTextChanged;
  final double? borderRadius;

  CustomSearchTextFormField({
    this.label,
    this.color,
    this.fillColor = Colors.white,
    this.fontSize,
    this.textEditingController,
    this.fontWeight,
    this.focusTo,
    this.validator,
    this.onSaved,
    this.inputType = TextInputType.text,
    this.maxLine = 1,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.isPasswordField = false,
    this.readOnly = false,
    this.suffixIcon,
    this.suffixText = "",
    this.prefixIcon,
    this.textinputFormatters,
    this.isEnabled = true,
    this.initialText,
    this.hint,
    this.onTextChanged,
    this.borderRadius = 10.0,
  });

  @override
  _CustomSearchTextFormFieldState createState() => _CustomSearchTextFormFieldState();
}

class _CustomSearchTextFormFieldState extends State<CustomSearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialText,
      onChanged: (text) {
        if (widget.onTextChanged != null) widget.onTextChanged!(text);
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          hintText: widget.hint,
          labelText: widget.label,
          prefixIcon: widget.prefixIcon,
          labelStyle: TextStyle(
              color: widget.color,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius!),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius!),
            ),
          ),
          /*border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius!),
            ),
          ),*/
          contentPadding: EdgeInsets.only(left: 10, right: 10),
          isDense: true,
          enabled: widget.isEnabled,
          suffix: Text(
            widget.suffixText!,
            style: TextStyle(color: Colors.black87),
          ),
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: widget._showPassword
                        ? Color.fromRGBO(53, 176, 9, 1)
                        : Colors.grey.shade200,
                  ),
                  onPressed: () {
                    setState(
                        () => widget._showPassword = !widget._showPassword);
                  },
                )
              : (widget.suffixIcon != null ? widget.suffixIcon : SizedBox())),
      keyboardType: widget.inputType,
      textInputAction: widget.textInputAction,
      maxLines: widget.maxLine,
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(widget.focusTo),
      onSaved: (value) {
        if (widget.onSaved != null) widget.onSaved!(value);
      },
      validator: (value) {
        if (widget.validator != null) return widget.validator!(value);
      },
      focusNode: widget.focusNode,
      controller: widget.textEditingController,
      obscureText: widget.isPasswordField ? !widget._showPassword : false,
      inputFormatters: widget.textinputFormatters,
      readOnly: widget.readOnly,
    );
  }
}
