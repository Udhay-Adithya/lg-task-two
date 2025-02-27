<p align="center">
  <img alt="VolTrac" src="assets/images/lg_logo.png" height="250px">
</p>  

# 🌍 Liquid Galaxy Remote Control App 🚀

Welcome to the **Liquid Galaxy Remote Control App**! This app allows you to remotely control and manage a **Liquid Galaxy system** by sending **KML files**, displaying **logos**, and executing various commands. 🎉

---

## 📂 Directory Structure

Here’s a breakdown of the app’s structure:

```
udhay-adithya-lg-task-two/
├── README.md
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
├── .metadata
├── assets/
│   ├── fonts/
│   │   └── Poppins font family (all variants)
│   ├── images/
│   └── kml/
│       ├── et.kml (Eiffel Tower KML)
│       └── sf.kml (San Francisco KML)
├── lib/
│   ├── init_dependencies.dart
│   ├── init_dependencies.main.dart
│   ├── main.dart
│   ├── core/
│   │   ├── common/
│   │   │   ├── ssh_connection/
│   │   │   │   ├── domain/
│   │   │   │   │   └── entity/
│   │   │   │   │       ├── connection_data.dart
│   │   │   │   │       └── connection_data.g.dart
│   │   │   │   └── presentation/
│   │   │   │       ├── ssh_client_cubit/
│   │   │   │       │   ├── ssh_clent_cubit.dart
│   │   │   │       │   └── ssh_connection_state.dart
│   │   │   │       └── widgets/
│   │   │   │           └── connection_indicator.dart
│   │   │   └── widgets/
│   │   │       ├── bottom_nav_bar.dart
│   │   │       └── loader.dart
│   │   ├── config/
│   │   │   ├── app_config.dart
│   │   │   └── app_locale.dart
│   │   ├── constants/
│   │   │   ├── api_constants.dart
│   │   │   ├── app_constants.dart
│   │   │   └── kml_constants.dart
│   │   ├── error/
│   │   │   ├── exceptions.dart
│   │   │   └── failure.dart
│   │   ├── network/
│   │   │   └── connection_checker.dart
│   │   ├── routes/
│   │   │   ├── app_router.dart
│   │   │   ├── app_routes.dart
│   │   │   ├── go_router_stream_refresh.dart
│   │   │   └── route_observer.dart
│   │   ├── services/
│   │   │   └── secure_store.dart
│   │   ├── theme/
│   │   │   ├── app_theme.dart
│   │   │   ├── color_scheme.dart
│   │   │   └── bloc/
│   │   │       ├── theme_bloc.dart
│   │   │       ├── theme_event.dart
│   │   │       └── theme_state.dart
│   │   ├── usecase/
│   │   │   └── usecase.dart
│   │   └── utils/
│   │       ├── show_snackbar.dart
│   │       ├── theme_switch.dart
│   │       └── theme_switch_button.dart
│   └── features/
│       ├── home/
│       │   ├── data/
│       │   │   ├── datasources/
│       │   │   │   └── home_remote_datasource.dart
│       │   │   ├── model/
│       │   │   │   ├── kml_model.dart
│       │   │   │   └── screen_overlay_model.dart
│       │   │   └── repository/
│       │   │       └── home_repository_impl.dart
│       │   ├── domain/
│       │   │   ├── entity/
│       │   │   │   ├── kml.dart
│       │   │   │   └── screen_overlay.dart
│       │   │   ├── repository/
│       │   │   │   └── home_repository.dart
│       │   │   └── usecases/
│       │   │       ├── clean_kml.dart
│       │   │       ├── clean_lg_logo.dart
│       │   │       ├── refresh_lg.dart
│       │   │       ├── send_kml.dart
│       │   │       └── send_lg_logo.dart
│       │   └── presentation/
│       │       ├── blocs/
│       │       │   ├── clean_kml/
│       │       │   │   ├── clean_kml_bloc.dart
│       │       │   │   ├── clean_kml_event.dart
│       │       │   │   └── clean_kml_state.dart
│       │       │   ├── clean_lg_logo/
│       │       │   │   ├── clean_lg_logo_bloc.dart
│       │       │   │   ├── clean_lg_logo_event.dart
│       │       │   │   └── clean_lg_logo_state.dart
│       │       │   ├── refresh_lg/
│       │       │   │   ├── refresh_lg_bloc.dart
│       │       │   │   ├── refresh_lg_event.dart
│       │       │   │   └── refresh_lg_state.dart
│       │       │   ├── send_kml_bloc/
│       │       │   │   ├── send_kml_bloc.dart
│       │       │   │   ├── send_kml_event.dart
│       │       │   │   └── send_kml_state.dart
│       │       │   └── send_lg_logo/
│       │       │       ├── send_lg_logo_bloc.dart
│       │       │       ├── send_lg_logo_event.dart
│       │       │       └── send_lg_logo_state.dart
│       │       ├── screens/
│       │       │   └── home_page.dart
│       │       └── widgets/
│       │           └── command_buttons.dart
│       └── settings/
│           └── presentation/
│               ├── screens/
│               │   └── settings_page.dart
│               └── widgets/
│                   ├── connect_button.dart
│                   └── input_field.dart
```

---

## 🛠️ Features

### 1. **Remote Control of Liquid Galaxy System** 🖥️
   - Send **KML files** to the Liquid Galaxy system.
   - Display **logos** as screen overlays.
   - Execute commands like **clearing KML files**, **refreshing the system**, and more.

### 2. **KML File Management** 📂
   - Upload and manage KML files (e.g., placemarks, tours, ground overlays).
### 3. **Bloc State Management** 🧠
   - Uses **Bloc** for state management to handle complex workflows like sending KML files, cleaning logos, and refreshing the system.

### 4. **SSH Connection** 🔐
   - Establish **SSH connections** to the Liquid Galaxy rigs.
   - Execute remote commands securely.

### 5. **Theming and UI** 🎨
   - Customizable themes (light/dark mode).
   - Clean and intuitive UI with **Poppins font** and responsive design.

---

## 🚀 How It Works

### 1. **SSH Connection**
- When the user initiates a connection, the app retrieves the connection details (either from user input or cached values) and establishes an SSH connection using the dartssh2 package.
- The connection status is updated in real-time, and the SSH client instance is stored in the GetIt service locator for global access.
- Once established, the SSH client instance is reused across the app to avoid redundant connections. This ensures efficient resource usage and a seamless user experience.

### 2. **Sending KML Files**
   - KML files are uploaded to the Liquid Galaxy system via **SFTP**.
   - The `kmls.txt` file is updated to include the URLs of the uploaded KML files.

### 3. **Displaying Logos**
   - Logos are displayed as **screen overlays** using KML `ScreenOverlay` elements.
   - The logo is placed on the **leftmost screen**.

### 4. **Executing Commands**
   - Commands like **clearing KML files**, **clearing logos**, and **refreshing the system** are executed remotely via SSH.

---

## 🛠️ Key Components

### 1. **Core**
   - **SSH Connection**: Handles SSH connections and remote command execution.
   - **State Management**: Uses **Bloc** for managing app state.
   - **Theming**: Supports light/dark themes with customizable colors.

### 2. **Features**
   - **Home**: Main screen for sending KML files, displaying logos, and executing commands.
   - **Settings**: Configure SSH connection details and app preferences.

### 3. **Assets**
   - **Fonts**: Includes the **Poppins** font family for a modern look.
   - **KML Files**: Predefined KML files for testing (e.g., Eiffel Tower, San Francisco).

---

## 🧑‍💻 How to Use

### 1. **Set Up SSH Connection**
   - Go to the **Settings** page.
   - Enter the **IP address**, **username**, and **password** for the Liquid Galaxy system.
   - Press Connect to establish a secure SSH connection.

### 2. **Send KML Files**
   - Go to the **Home** page.
   - Use the **San Francisco** or **Eiffel Tower** button to upload and display KML files.

### 3. **Display Logos**
   - Use the **Send Logo** button to display a logo on the leftmost screen.

### 4. **Execute Commands**
   - Use the **Clean KML**, **Refresh System**, and **Stop Tour** buttons to execute remote commands.

---

## 🛠️ Tools and Packages Used

- **Flutter**: For building the app.
- **dartssh2**: For SSH connections and remote command execution.
- **Bloc**: For state management.
- **Hive**: For caching storing connection details.

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/udhay-adithya-lg-task-two.git
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## 🙏 Credits

- **Poppins Font**: Designed by Indian Type Foundry.
- **Liquid Galaxy**: For the amazing multi-screen visualization platform.

---

Enjoy controlling your Liquid Galaxy system with ease! 🌟