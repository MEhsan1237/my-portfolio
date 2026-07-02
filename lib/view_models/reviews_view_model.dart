import '../models/review_model.dart';

class ReviewsViewModel {
  final List<ReviewModel> reviews = [
    ReviewModel(
      name: "Alex Thompson",
      role: "CEO at TechFlow",
      review: "Ehsan is an exceptional developer. He transformed our complex requirements into a seamless, high-performance Flutter application. His attention to detail and UI/UX expertise is truly world-class.",
      image: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop",
      rating: 5.0,
    ),
    ReviewModel(
      name: "Sarah Jenkins",
      role: "Product Manager",
      review: "Working with Ehsan was a game-changer for our startup. He didn't just code; he provided valuable insights that improved our product's user flow significantly.",
      image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop",
      rating: 5.0,
    ),
    ReviewModel(
      name: "David Chen",
      role: "Founder of GlobalPay",
      review: "The level of professionalism and technical mastery Ehsan brings to the table is rare. He delivered our fintech solution ahead of schedule with zero compromises on security or performance.",
      image: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200&h=200&fit=crop",
      rating: 5.0,
    ),
    ReviewModel(
      name: "Emily Rodriguez",
      role: "Creative Director",
      review: "Ehsan has a unique ability to bridge the gap between design and development. The animations and transitions he implemented in our app are incredibly smooth and visually stunning.",
      image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop",
      rating: 4.9,
    ),
  ];
}
