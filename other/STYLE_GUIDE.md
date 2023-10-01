# Core Dumped APP Project Style Guide

## Table of Contents

1. [Introduction](#introduction)
2. [File and Folder Structure](#file-and-folder-structure)
3. [Naming Conventions](#naming-conventions)
4. [Formatting and Indentation](#formatting-and-indentation)
5. [Imports](#imports)
6. [Widget Layout and Structure](#widget-layout-and-structure)
7. [Comments](#comments)
8. [State Management](#state-management)
9. [Error Handling](#error-handling)
10. [Testing](#testing)
11. [Documentation](#documentation)

### Introduction
This style guide aims to provide coding standards and best practices for developing a professional Flutter mobile application. Adhering to these guidelines will improve code consistency and maintainability.

### File and Folder Structure
- Organize your project into logical folders such as `lib/`, `assets/`, `test/`, and `lib/screens/`.
- Use PascalCase for Dart files (e.g., `MyWidget.dart`, `HomePage.dart`).
- Use snake_case for image and asset files (e.g., `app_logo.png`, `user_avatar.jpg`).

### Naming Conventions
- Use descriptive and meaningful names for variables, classes, and functions.
- Follow the Dart naming conventions.
- Prefix private variables with an underscore (e.g., `_privateVariable`).

### Formatting and Indentation
- Use the `dart format` command to automatically format your code.
  - You can also use the `Format Document` command in VS Code or Android Studio.
- Use 2 spaces for indentation.

### Imports
- Group and order your imports as follows:
    1. Dart standard libraries.
    2. Third-party packages.
    3. Your project's files (relative imports).
- Separate each group with a single blank line.

Example:
```dart
import 'dart:async';
import 'package:flutter/material.dart';

import 'my_custom_widget.dart';
import 'utils/utils.dart';
````
### Widget Layout and Structure
- Use the Flutter widget hierarchy to build user interfaces.
- Prefer functional and stateless widgets when possible.
- Keep widget trees shallow and delegate complex logic to separate classes.
- Use `const` constructors for widgets with constant properties.

### Comments
- Use comments to explain complex or non-intuitive code.
- Write doc comments for classes, methods, and functions.
- Avoid excessive commenting for self-explanatory code.

### State Management
- Choose an appropriate state management solution (e.g., Provider, Bloc, Riverpod) based on project requirements.
- Separate UI logic from business logic.
- Avoid using `setState` in large widget trees.

### Error Handling
- Handle errors gracefully and provide informative error messages to users.
- Use try-catch blocks for error handling when necessary.
- Log errors for debugging purposes.

### Testing
- Write unit tests and widget tests to ensure code reliability.
- Use the `flutter_test` package for widget testing.
- Follow testing best practices, such as Arrange-Act-Assert (AAA) pattern.

### Documentation
- Document your code using Dartdoc comments.
- Update  `README.md` file with project documentation, installation instructions, and usage guidelines.

By following this style guide, you'll be able to maintain a clean, consistent, and professional codebase for your Flutter mobile project. Make sure to communicate these guidelines to your team members and consistently enforce them throughout the development process.

