# Task_Assist
Simple flutter to do list application
# Task Assist Flutter Application

## Overview

Task Assist is a Flutter application designed to help users manage their daily tasks across different categories: Home, Shopping, and Work. The application allows users to add, view, and remove tasks in a user-friendly interface with a bottom navigation bar to switch between task categories.

## Features

- **Home Page:** Manage home-related tasks.
- **Shopping Page:** Manage shopping-related tasks.
- **Work Page:** Manage work-related tasks.
- **Bottom Navigation Bar:** Easy navigation between Home, Shopping, and Work pages.
- **Add Task Dialog:** Add new tasks via a dialog interface.
- **Checkbox Task Completion:** Mark tasks as completed with a checkbox; completed tasks are removed after a delay.

## File Structure

- `main.dart`: The main entry point of the application containing the primary structure and navigation.
- `MyApp`: Main application widget.
- `MyHomePage`: Stateful widget that manages the bottom navigation and displays different task pages.
- `HomePage`, `ShoppingPage`, `WorkPage`: Stateful widgets for managing tasks in their respective categories.
- `TaskItem`: Model class for representing a task item.

### Prerequisites for installation

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)

## TODO
Add data persistence for lists
