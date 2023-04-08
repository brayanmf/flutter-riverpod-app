# manejando rotuer mediante riverpod

- tambien se puede hacer por provider
```

    return MaterialApp.router(
      title: 'Riverpod Providers',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: false ).getTheme(),
    );
  

-----
final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/provider',
      builder: (context, state) => const ProviderScreen(),
    ),

    GoRoute(
      path: '/provider-router',
      builder: (context, state) => const RouterScreen(),
    ),

    GoRoute(
      path: '/state-provider',
      builder: (context, state) => const StateProviderScreen(),
    ),

    GoRoute(
      path: '/todo',
      builder: (context, state) => const TodoScreen(),
    ),

    GoRoute(
      path: '/future-provider',
      builder: (context, state) => const FutureProviderScreen(),
    ),

    GoRoute(
      path: '/future-family-provider',
      builder: (context, state) => const FamilyFutureScreen(),
    ),

    GoRoute(
      path: '/stream-provider',
      builder: (context, state) => const StreamProviderScreen(),
    ),

    GoRoute(
      path: '/change-notifier-provider',
      builder: (context, state) => const ChangeNotifierScreen(),
    ),

    GoRoute(
      path: '/state-notifier-provider',
      builder: (context, state) => const StateNotifierScreen(),
    ),



  ]);

```

> nos puede servir

'
 pueda que no tengamos acceso al context o 
quereamos tener la intancia 
'