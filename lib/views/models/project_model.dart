class ProjectModel {
  String name;
  List<String> imageUrl;
  String description;
  String url;
  List<String> tags;

  ProjectModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.url,
    required this.tags,
  });
}

// https://raw.githubusercontent.com/pratikpwr/Portfolio/blob/master/projects/
class ProjectList {
  List<ProjectModel> projects = [
    ProjectModel(
        name: 'SwipeUp News',
        tags: ['Flutter', 'Dart', 'Rest API'],
        imageUrl: ['swipeUp.png'],
        description:
            'SwipeUp News App, Built a News app using Flutter. Used NewsAPI.org APIs for news. The app has features like Searching Topics, Reading News from Different Categories, and Specific Sources. The app also has a feature to read the detailed news on a website. Play Store Link -: https://play.google.com/store/apps/details?id=com.pratik.swipe_up_news',
        url: 'https://github.com/pratikpwr/SwipeUp-News'),
    ProjectModel(
        name: 'College Buddy',
        tags: ['Flutter', 'Dart', 'Flask', 'Python', 'Rest API'],
        imageUrl: ['collegeBuddy.png'],
        description:
            'College Buddy, An App for college students to check out their timetable quickly. It shows ongoing and next lecture. in the app, teachers can upload timetable, Assignments, and notices. Students can stay updated with the notices. The app is made in Flutter and Dart and for the backend Flask and python RestAPI\'s.',
        url: 'https://github.com/pratikpwr/TimeTable-APP'),
    ProjectModel(
        name: 'All Kart',
        tags: ['Flutter', 'Dart', 'Firebase'],
        imageUrl: ['allKart.png'],
        description:
            'AllKart App is an E-commerce Flutter app. In this app, I used Firebase as the backend of the app. I used the Flutter provider package for State Management. I added User Authentication and Animations in app.',
        url: 'https://github.com/pratikpwr/All-Kart'),
    // ProjectModel(
    //     projectName: 'Chat App',
    //     tags: ['Flutter', 'Dart', 'Firebase'],
    //     imageUrl: [
    //       'https://cdn.dribbble.com/users/2168386/screenshots/14855310/media/24762aceb17d00bcbafb8992f0dc20aa.png?compress=1&resize=1000x750'
    //     ],
    //     desc: 'Chatting App',
    //     url: 'https://github.com/pratikpwr/Chat-App'),
    ProjectModel(
        name: 'Music App UI',
        tags: ['Flutter', 'Dart', 'Flutter UI'],
        imageUrl: ['musicUI.png'],
        description:
            'Music App Complex UI. Inspired by Dribble design by Alex Arutuynov',
        url: 'https://github.com/pratikpwr/MusicPlayer'),
    ProjectModel(
        name: 'Flutter Animations',
        tags: ['Flutter', 'Dart', 'Flutter UI'],
        imageUrl: ['flutterAnimations.png'],
        description:
            'A Flutter App to learn Complex Animations.\n- Animated Container     - Aniamted List     - Hero Animation \n- Explicite Animation     - Tweens     - Tween Sequence\n- TweenAnimationBuilder',
        url: 'https://github.com/pratikpwr/Fllutter-Animations'),
    ProjectModel(
        name: 'My PortFolio',
        tags: ['Flutter', 'Dart', 'Flutter Web'],
        imageUrl: ['myPortfolio.png'],
        description:
            'My Portfolio App, Made in Flutter Web, This site is Responsive for Mobile, Web and multiple screen sizes',
        url: 'https://pratikpwr.github.io/Portfolio/#/'),
    // ProjectModel(
    //     projectName: 'AR E-commerce',
    //     tags: ['XD', 'UI', 'UX'],
    //     imageUrl: [
    //       'https://cdn.dribbble.com/users/2168386/screenshots/14855310/media/24762aceb17d00bcbafb8992f0dc20aa.png?compress=1&resize=1000x750'
    //     ],
    //     desc: 'AR E-commerce App',
    //     url: ''),
    ProjectModel(
        name: 'Nrityosava',
        tags: ['Flutter', 'Dart', 'Internship'],
        imageUrl: ['nrityosava.png'],
        description: 'App To learn katthak, Katthak Videos through Youtube Plugin',
        url:
            'https://play.google.com/store/apps/details?id=com.isolsgroup.nrityosava'),
    ProjectModel(
        name: 'AAFM India',
        tags: ['Flutter', 'Dart', 'Internship', 'Rest API'],
        imageUrl: ['aafm.png'],
        description: 'AAFM India Cerifiacte Verification App. ISOLS Group',
        url:
            'https://play.google.com/store/apps/details?id=com.isolsgroup.aafm'),
    ProjectModel(
        name: 'How to crack ssb',
        tags: ['Flutter', 'Dart', 'Internship', 'Web-to-flutter'],
        imageUrl: ['ssb.png'],
        description: 'How to crack ssb website to app through webview plugin',
        url:
            'https://play.google.com/store/apps/details?id=com.isolsgroup.ssbforum'),
  ];

  List<ProjectModel> getProjects() {
    return projects;
  }
}
