import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                width: 0.20.sw,
                height: 0.20.sw,
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    width: 0.184.sw,
                    height: 0.184.sw,
                    child: Center(
                      child: SizedBox(
                        width: 0.17.sw,
                        height: 0.17.sw,
                        child: const CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Emily'),
                  Text('Wanna have lunch with me ?'),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                children: [
                  const Text('9:41'),
                  Badge.count(
                    count: 3,
                    backgroundColor: Colors.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
