import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../../models/music_model.dart';

class ItemMusic extends StatelessWidget {
  const ItemMusic({
    super.key,
    required this.model, required this.callBack,
  });

  final MusicModel model;
  final ValueChanged<MusicModel> callBack;
  
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBack.call(model);
      },
      child: Container(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shadowColor: Colors.grey,
                  child: Image.asset(
                      model.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                    Text(model.author!),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(model.time!),
                const SizedBox(
                  width: 20,
                ),
                Assets.icons.group.svg(),
                const SizedBox(
                  width: 30,
                ),
                Assets.icons.vector4.svg(),
              ],
            ),
        
          ],
        ),
      ),
    );
  }
}
