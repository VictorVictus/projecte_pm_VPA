// lib/widgets/horizontal_card_list.dart

import 'package:flutter/material.dart';

class HorizontalCardList extends StatelessWidget {
  // Canviem l'estructura: ara esperem una llista d'items genèrics
  // Cada item ha de tenir: 'title', 'subtitle', 'imageUrl', 'id', 'type'
  final List<Map<String, dynamic>> items; 
  final String listName;
  final Function(String id, String type)? onTap; // Callback per quan es prem un item

  const HorizontalCardList({
    required this.items, 
    required this.listName, 
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Marge lateral pel títol
          child: Text(
            listName,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding inicial i final de la llista
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              
              // Extracció segura de dades
              final title = item['title'] ?? 'Sense títol';
              final subtitle = item['subtitle'] ?? ''; // Pot ser artista o propietari
              final coverUrl = item['imageUrl'] ?? 'https://via.placeholder.com/200?text=Music';
              final id = item['id'] ?? '';
              final type = item['type'] ?? 'unknown';

              return GestureDetector(
                onTap: () => onTap?.call(id, type),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(
                    width: 140, // Una mica més ample
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Imatge
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            coverUrl,
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 140,
                              height: 140,
                              color: Colors.grey.shade800,
                              child: const Icon(Icons.music_note, color: Colors.white54, size: 50),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Títol
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Subtítol (Artista / Tipus)
                        if (subtitle.isNotEmpty)
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}