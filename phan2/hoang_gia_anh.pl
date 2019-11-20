% fact
male('Prince Phillip').
male('Prince Charles').
male('Captain Mark Phillips').
male('Timothy Laurence').
male('Prince Andrew').
male('Prince Edward').
male('Prince William').
male('Prince Harry').
male('Peter Phillips').
male('Mike Tindall').
male('James, Viscount Severn').
male('Prince George').

female('Queen Elizabeth II').
female('Princess Diana').
female('Camilla Parker Bowles').
female('Princess Anne').
female('Sarah Ferguson').
female('Sophie Rhys-jones').
female('Kate Middleton').
female('Autumn Kelly').
female('Zara Phillips').
female('Princess Beatrice').
female('Princess Eugenie').
female('Princess Charlotte').
female('Savannah Phillips').
female('Isla Phillips').
female('Mia Grace Tindall').

married('Queen Elizabeth II', 'Prince Phillip').
married('Prince Phillip', 'Queen Elizabeth II').
married('Prince Charles', 'Camilla Parker Bowles').
married('Camilla Parker Bowles', 'Prince Charles').
married('Princess Anne', 'Timothy Laurence').
married('Timothy Laurence', 'Princess Anne').
married('Sophie Rhys-jones', 'Prince Edward').
married('Prince Edward', 'Sophie Rhys-jones').
married('Prince William', 'Kate Middleton').
married('Kate Middleton', 'Prince William').
married('Autumn Kelly', 'Peter Phillips').
married('Peter Phillips', 'Autumn Kelly').
married('Zara Phillips', 'Mike Tindall').
married('Mike Tindall', 'Zara Phillips').

divorced('Prince Charles', 'Princess Diana').
divorced('Princess Diana', 'Prince Diana').
divorced('Captain Mark Phillips', 'Princess Anne').
divorced('Princess Anne', 'Captain Mark Phillips').
divorced('Sarah Ferguson', 'Prince Andrew').
divorced('Prince Andrew', 'Sarah Ferguson').

parent('Prince William','Prince George').
parent('Prince William','Princess Charlotte').
parent('Kate Middleton','Prince George').
parent('Kate Middleton','Princess Charlotte').
parent('Autumn Kelly','Savannah Phillips').
parent('Autumn Kelly','Isla Phillips').
parent('Peter Phillips','Savannah Phillips').
parent('Peter Phillips','Isla Phillips').
parent('Zara Phillips','Mia Grace Tindall').
parent('Mike Tindall','Mia Grace Tindall').
parent('Princess Diana','Prince William').
parent('Princess Diana','Prince Harry').
parent('Prince Charles','Prince William').
parent('Prince Charles','Prince Harry').
parent('Captain Mark Phillips','Peter Phillips').
parent('Captain Mark Phillips','Zara Phillips').
parent('Princess Anne','Peter Phillips').
parent('Princess Anne','Zara Phillips').
parent('Sarah Ferguson','Princess Beatrice').
parent('Sarah Ferguson','Princess Eugenie').
parent('Prince Andrew','Princess Beatrice').
parent('Prince Andrew','Princess Eugenie').
parent('Sophie Rhys-jones','James, Viscount Severn').
parent('Sophie Rhys-jones','Lady Louise Mountbatten-Windsor').
parent('Prince Edward','James, Viscount Severn').
parent('Prince Edward','Lady Louise Mountbatten-Windsor').
parent('Queen Elizabeth II','Prince Charles').
parent('Queen Elizabeth II','Princess Anne').
parent('Queen Elizabeth II','Prince Andrew').
parent('Queen Elizabeth II','Prince Edward').
parent('Prince Phillip','Prince Charles').
parent('Prince Phillip','Princess Anne').
parent('Prince Phillip','Prince Andrew').
parent('Prince Phillip','Prince Edward').

% rules
% chong
husband(Person, Wife) :-
	married(Person, Wife),
	male(Person).
% vo
wife(Person, Husband) :-
	married(Person, Husband),
	female(Person).
% bo
father(Parent, Child) :-
	parent(Parent, Child),
	male(Parent).
% me
mother(Parent, Child) :-
	parent(Parent, Child),
	female(Parent).
% con cai
child(Child, Parent) :-
	parent(Parent, Child).
% con trai
son(Child, Parent) :-
	child(Child, Parent),
	male(Child).
% con gai
daughter(Child, Parent) :-
	child(Child, Parent),
	female(Child).
% ong ba
grandparent(GrandParent, GrandChild) :-
	parent(GrandParent, Parent),
	parent(Parent, GrandChild).
% ba
grandmother(GrandMother, GrandChild) :-
	grandparent(GrandMother, GrandChild),
	female(GrandMother).
% ong
grandfather(GrandFather, GrandChild) :-
	grandparent(GrandFather, GrandChild),
	male(GrandFather).
% chau
grandchild(GrandChild, GrandFather) :-
	grandparent(GrandFather, GrandChild).
% chau trai
grandson(GrandSon, GrandFather) :-
	grandchild(GrandSon, GrandFather),
	male(GrandSon).
% chau gai
granddaughter(GrandDaugter, GrandFather) :-
	grandchild(GrandDaugter, GrandFather),
	female(GrandDaugter).

% A sibling is having one or both parents in common
% anh em ruoi co 1 hoac ca bo va me
sibling(Person1, Person2) :-
	parent(Parent, Person1),
	parent(Parent, Person2),
	Person1 \== Person2. %2 cai nay ko giong nhau
% con trai ruot
brother(Person, Sibling) :-
	sibling(Person, Sibling),
	male(Person).
% con gai ruot
sister(Person, Sibling) :-
	sibling(Person, Sibling),
	female(Person).

% An aunt is a person who is the sister of a parent,
% or the wife of one's uncle
% di la con gai cua bo me hoac la vo cua chu
aunt(Person, NieceNephew) :-  % di cua chau trai, chau gai
	sister(Person, Parent), % di la chi,em gai voi bo me
	parent(Parent, NieceNephew).

aunt(Person, NieceNephew) :-
	wife(Person, Uncle), % di ket hon voi chu
	brother(Uncle, Parent), % chu la anh,em trai voi bo me
	parent(Parent, NieceNephew).
% chu
uncle(Person, NieceNephew) :-
	brother(Person, Parent),
	parent(Parent, NieceNephew).

uncle(Person, NieceNephew) :-
	husband(Person, Aunt),
	sister(Aunt, Parent),
	parent(Parent, NieceNephew).
% chau gai
niece(Person, AuntUncle) :-
	uncle(AuntUncle, Person),
	female(Person).

niece(Person, AuntUncle) :-
	aunt(AuntUncle, Person),
	female(Person).
% chau trai
nephew(Person, AuntUncle) :-
	uncle(AuntUncle, Person),
	male(Person).

nephew(Person, AuntUncle) :-
	aunt(AuntUncle, Person),
	male(Person).
