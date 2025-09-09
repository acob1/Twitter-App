// Custom Twitter-like Like Button with Animation
import 'package:flutter/material.dart';

class TwitterLikeButton extends StatefulWidget {
  final bool isLiked;
  final String count;
  final VoidCallback onTap;

  const TwitterLikeButton({
    super.key,
    required this.isLiked,
    required this.count,
    required this.onTap,
  });

  @override
  State<TwitterLikeButton> createState() => _TwitterLikeButtonState();
}

class _TwitterLikeButtonState extends State<TwitterLikeButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    
    // Main animation controller for the heart bounce
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Scale controller for the bounce effect
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // Scale animation with bounce curve
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    // Color animation from gray to red
    _colorAnimation = ColorTween(
      begin: Colors.grey.shade600,
      end: const Color(0xFFE91E63), // Twitter's like red color
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(TwitterLikeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (oldWidget.isLiked != widget.isLiked) {
      if (widget.isLiked) {
        // Animate to liked state
        _animationController.forward();
        _scaleController.forward().then((_) {
          _scaleController.reverse();
        });
      } else {
        // Animate to unliked state
        _animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          AnimatedBuilder(
            animation: Listenable.merge([_scaleAnimation, _colorAnimation]),
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Icon(
                  widget.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _colorAnimation.value ?? Colors.grey.shade600,
                  size: 20,
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Text(
                widget.count,
                style: TextStyle(
                  color: _colorAnimation.value ?? Colors.grey.shade600,
                  fontSize: 14,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}