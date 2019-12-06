1. vu_1 có phải là đầu bếp?
chef(vu_1).

2. Đầu bếp có những ai? 
findall(X, chef(X), Chef).

3. Những nguyên liệu nào đến từ Trung Quốc?
findall(X, source(X, china), FromChina).

4. truc_1 có bị dị ứng với “Hành” hay không?
allergy(truc_1, garlic).

5. Ai là người ăn chay?
findall(X, vegetarian(X), Vegetarian).

6. Làm mon trứng chiên thì cần những nguyên liệu gì?
findall(X, ingredient_in_dish(X, fried_egg), I).

7. Cá chiên có cần để thịt hay không?
ingredient_in_dish(meat(X), fried_fish).

8. Có được uống rượu trong sinh nhật không?
drink_in_event(wine, birthday).

9. thin_1 là đầu bếp trong những sự kiên nào?
findall(E, chef_in_event(thin_1, E), Event).

10. truc_1 không thể ăn được những mon nào?
findall(X, cant_eat(truc_1, X), FoodTruc).

11. Tiệc đám cưới có vui không?
not_fun_event(wedding).

12. truc_2 có đến được buổi tiệc sinh nhật không?
cant_join(truc_2, birthday).

13. Người ăn chay thì không ăn được những thứ gì?
findall(X, (vegetarian(P), cant_eat(P, X)), V).

14. Liệt kê những mon cao cấp (high_grade_dish)?
findall(D, high_grade_dish(D), Dish).

15. Liệt kê những nguyên liệu cao cấp, có nguồn gốc từ Nhật Bản?
findall(D, high_grade_ingredient(D),FoodJapan).

16. Đám cưới thì cần những nguyên liệu từ nguồn nào?
ingredient_in_event(I, wedding).

17. thin_2 có uống được rượu không?
cant_drink(thin_2, wine).

18. thin_1 và thin_2 có làm đầu bếp trong cùng tiệc đám cưới không?
same_chefs_event(thin_1, thin_2, wedding).

19. Những mon ăn nào được sử dụng trong tiệc gia đình và đến từ Trung Quốc?
findall(D, (dish_in_event(D, family_meeting), source_in_dish(china, D)), Dish).

20. Đầu bếp thin_1 có phụ trách cả 2 sự kiện wedding và birthday không?
same_chef_events(thin_1, wedding, birthday).
