# Stardy AI — Profile / Course Flow

## What's in `lib/`
This is only the `lib/` source + `pubspec.yaml` — not a full scaffolded Flutter
project (no `ios/`, `android/` folders). Those platform folders contain
generated Xcode/Gradle project files that need to come from `flutter create`,
not be hand-written, or you'll get subtle signing/build issues.

## Screen flow

```
ProfileScreen ("@lakshya_12")
   │  tap a Career Interest chip (e.g. "UI UX Design")
   ▼
CourseDetailScreen ("UI UX DESIGN" overview, Skills to Know, Start Course)
   │  tap "Start Course"
   ▼
SubjectLessonsScreen (lesson list, checkmarks, "YAY! You've finished it!")
```

- Back arrow on `SubjectLessonsScreen` → pops to `CourseDetailScreen`.
- Back arrow on `CourseDetailScreen` → pops to `ProfileScreen`.
- Bottom nav bar (only on `CourseDetailScreen`) — tapping the home icon
  jumps straight back to `/profile`.
- Tapping a lesson tile in `SubjectLessonsScreen` currently loops back to
  `CourseDetailScreen` as a placeholder for a real lesson-player screen.

## Run it on the iPhone 16e Simulator (on a Mac, in Terminal)

1. Make sure Xcode (with the iOS 18 simulator runtime that includes
   "iPhone 16e") and Flutter are installed:
   ```
   flutter doctor
   ```
   Fix anything it flags before continuing.

2. Scaffold a real Flutter project (this generates the `ios/`/`android/`
   folders you don't get from just a `lib/` folder):
   ```
   flutter create stardy_ai
   cd stardy_ai
   ```

3. Replace the generated `lib/` and `pubspec.yaml` with the ones from this
   zip:
   ```
   rm -rf lib
   cp -r /path/to/stardy_profile_feature/lib .
   cp /path/to/stardy_profile_feature/pubspec.yaml .
   ```

4. Install dependencies:
   ```
   flutter pub get
   ```

5. Boot the iPhone 16e simulator specifically:
   ```
   xcrun simctl list devices | grep "16e"
   open -a Simulator
   xcrun simctl boot "iPhone 16e"
   ```
   (If "iPhone 16e" isn't listed, open Xcode → Settings → Platforms and
   install the matching iOS runtime, or create the device manually in
   Simulator → File → New Simulator Device.)

6. Run:
   ```
   flutter run
   ```
   Flutter will detect the booted simulator automatically. If you have
   multiple devices, use `flutter devices` to get the id and
   `flutter run -d <device-id>`.

## Notes
- Images (avatar, lesson thumbnails) load over HTTPS from `pravatar.cc` and
  `picsum.photos` as placeholders — swap `NetworkImage`/`Image.network` calls
  in `profile_provider.dart` and `course_provider.dart` for your real asset
  URLs or `Image.asset()` calls once you have final artwork.
- `Icons.forum_rounded` stands in for the Discord glyph since Material Icons
  has no Discord icon. Add `font_awesome_flutter` and swap in
  `FontAwesomeIcons.discord` for the real brand mark.
- Brand colors live in `lib/core/theme/app_colors.dart` — these are close
  approximations from the screenshots; replace with your PDF's exact hex
  values.
