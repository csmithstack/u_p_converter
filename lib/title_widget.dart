import 'package:flutter/material.dart';

TextField(
                      // Formerly wrapped in SizedBox
                      controller = _titleController,
                      //textAlignVertical: TextAlignVertical.top,
                      textAlign = TextAlign.center,
                      textAlignVertical = TextAlignVertical.top,
                      cursorHeight = 20,
                      maxLines = 1,
                      maxLength = 20,
                      style = const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration = const InputDecoration(
                        //constraints: BoxConstraints(maxWidth: 300),
                        counterText: '', // Hides the character count
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                      ),
/*                         strutStyle: const StrutStyle(
                          fontSize: 20.0,
                          forceStrutHeight: true,
                        ), */
                      keyboardType = TextInputType.text,
                    )),
                //),