1. chef(cuong).
2. findall(X, chef(X), Chef).
3. findall(X, source(X, china), FromChina).
4. allergy(hung, garlic).
5. findall(X, vegetarian(X), Vegetarian).
6. findall(X, ingredient_in_dish(X, fried_egg), I).
7. ingredient_in_dish(meat(X), fried_fish).
8. drink_in_event(wine, birthday).
9. findall(E, chef_in_event(thin, E), Event).
10. findall(X, cant_eat(hung, X), FoodHy).
11. not_fun_event(wedding).
12. cant_join(cuong, birthday).
13. findall(X, (vegetarian(P), cant_eat(P, X)), V).
14. findall(D, high_grade_dish(D), Dish).
15. findall(X, (ingredient_in_dish(X, fried_egg), source(X, vietnam), I).
16. ingredient_in_event(I, wedding).
17. cant_drink(truc, wine).
18. same_chefs_event(kim, cuong, wedding).
19. findall(D, (dish_in_event(D, family_meeting), source_in_dish(china, D)), Dish).
20. findall((E1, E2), (same_ingredient_events(I, E1, E2), cource(I, vietnam), E1 \== E2), Event).
