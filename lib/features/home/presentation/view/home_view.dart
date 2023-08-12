import 'package:chat_app/features/app/controller/module.dart';
import 'package:chat_app/features/home/presentation/controller/websocket_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/message_tile.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> messageTypes = [
      "All",
      "Office",
      "Family",
      "Archive",
    ];
    final selectedMessageTypeIndex = useValueNotifier(0);
    final isSearchEnaled = useValueNotifier(false);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          if (ref.read(appControllerProvider).loginState) {
            await ref
                .read(webSocketControllerProvider.notifier)
                .establishWebSocketConnection();
          }
        });
        return null;
      },
      const [],
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Consumer(builder: (context, ref, _) {
                              final Color backgroundColor = ref
                                      .watch(webSocketControllerProvider)
                                      .isConnected
                                  ? Colors.lightGreen
                                  : Colors.red;
                              return CircleAvatar(
                                radius: 10.r,
                                backgroundColor: backgroundColor,
                              );
                            }),
                          ),
                        ],
                      ),
                      /* const CircleAvatar(
                        radius: 35,
                      ), */
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(text: '💼'),
                                const WidgetSpan(
                                  child: SizedBox(width: 5),
                                ),
                                TextSpan(
                                  text: 'At Work',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      isSearchEnaled.value = !isSearchEnaled.value;
                    },
                    icon: ValueListenableBuilder(
                      valueListenable: isSearchEnaled,
                      builder: (context, value, _) {
                        return Icon(value ? Icons.close : Icons.search);
                      },
                    ),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text('Logout'),
                        onTap: () {
                          ref.read(appControllerProvider).loginState = false;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isSearchEnaled,
              builder: (context, value, _) {
                return Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  visible: value,
                  child: AnimatedOpacity(
                    onEnd: () {},
                    opacity: isSearchEnaled.value ? 1 : 0,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.1),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 5.h,
                              vertical: 10.h,
                            ),
                            hintText: 'Search',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.9),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'Chat',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: const Center(child: Text('34')),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 25,
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: selectedMessageTypeIndex,
                        builder: (context, value, _) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: messageTypes.map(
                              (item) {
                                final int index = messageTypes.indexOf(item);
                                return InkWell(
                                  onTap: () {
                                    selectedMessageTypeIndex.value = index;
                                  },
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: index == value
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Transform.rotate(
                                  angle: 45,
                                  child: Icon(
                                    Icons.push_pin,
                                    color: Colors.grey.shade600,
                                    size: 12,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Pinned',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                            const MessageTile(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
