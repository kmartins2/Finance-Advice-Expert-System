advice(save_more) :- save_more.
advice(invest_conservatively) :- invest_conservatively.
advice(invest_aggressively) :- invest_aggressively.
advice(reduce_expenses) :- reduce_expenses.
advice(create_budget) :- create_budget.
advice(build_emergency_fund) :- build_emergency_fund.
advice(diversify_investments) :- diversify_investments.
advice(seek_financial_advisor) :- seek_financial_advisor.
advice(pay_off_debt) :- pay_off_debt.
advice(increase_income) :- increase_income.
advice(consider_side_hustle) :- consider_side_hustle.
advice(avoid_large_purchases) :- avoid_large_purchases.
advice(save_for_retirement) :- save_for_retirement.
advice(refinance_loans) :- refinance_loans.
advice(start_investing) :- start_investing.
advice(save_for_vacation) :- save_for_vacation.
advice(increase_insurance_coverage) :- increase_insurance_coverage.
advice(downsize_home) :- downsize_home.
advice(plan_for_education) :- plan_for_education.
advice(avoid_unnecessary_loans) :- avoid_unnecessary_loans.
advice(build_credit_score) :- build_credit_score.

save_more :-
    income(I), expenses(E), savings(S),
    I < 2000, E > 1500, S < 500.

invest_conservatively :-
    income(I), savings(S), investments(Inv),
    I > 3000, S > 10000, Inv < S * 0.2.

invest_aggressively :-
    income(I), savings(S), investments(Inv),
    I > 5000, S > 20000, Inv < S * 0.4.

reduce_expenses :-
    income(I), expenses(E),
    E > I * 0.8.

create_budget :-
    income(I), expenses(E), savings(S),
    I > 2000, E > 1500, S < 2000.

build_emergency_fund :-
    savings(S), income(I),
    S < I * 3.

diversify_investments :-
    savings(S), investments(Inv),
    S > 20000, Inv < S * 0.3.

seek_financial_advisor :-
    debt(D),
    D > 20000.

pay_off_debt :-
    debt(D), savings(S),
    D > 5000, S > D * 0.5.

increase_income :-
    income(I),
    I < 2000.

consider_side_hustle :-
    income(I), expenses(E),
    I < 3000, E > 2000.

avoid_large_purchases :-
    savings(S),
    S < 1000.

save_for_retirement :-
    age(A), savings(S),
    A > 30, S < 50000.

refinance_loans :-
    debt(D), interest_rate(IR),
    D > 10000, IR > 5.

start_investing :-
    income(I), savings(S), investments(Inv),
    I > 3000, S > 5000, Inv =:= 0.

save_for_vacation :-
    savings(S), income(I),
    S > I * 2, I > 3000.


increase_insurance_coverage :-
    income(I), insurance_coverage(C),
    I > 4000, C < 100000.

downsize_home :-
    expenses(E), housing_costs(HC),
    HC > E * 0.4.

plan_for_education :-
    dependents(D), savings(S),
    D > 0, S < D * 20000.

avoid_unnecessary_loans :-
    debt(D), income(I),
    D > I * 0.5.

build_credit_score :-
    credit_score(CS),
    CS < 600.

ask_financial_status :-
    write('What is your monthly income (in £)? '),
    read(Income),
    assertz(income(Income)),

    write('What are your monthly expenses (in £)? '),
    read(Expenses),
    assertz(expenses(Expenses)),

    write('What is your current savings amount (in £)? '),
    read(Savings),
    assertz(savings(Savings)),

    write('What is your current debt amount (in £)? '),
    read(Debt),
    assertz(debt(Debt)),

    write('What is your current investment amount (in £)? '),
    read(Investments),
    assertz(investments(Investments)),

    write('What is your current credit score? '),
    read(CreditScore),
    assertz(credit_score(CreditScore)),

    write('What is your age? '),
    read(Age),
    assertz(age(Age)),

    write('What is your monthly healthcare cost (in £)? '),
    read(HealthcareCosts),
    assertz(healthcare_costs(HealthcareCosts)),

    write('What is your housing cost (in £)? '),
    read(HousingCosts),
    assertz(housing_costs(HousingCosts)),

    write('What is your loan interest rate ? '),
    read(InterestRate),
    assertz(interest_rate(InterestRate)),

    write('How many dependents do you have? '),
    read(Dependents),
    assertz(dependents(Dependents)),

    write('What is your insurance coverage amount (in £)? '),
    read(InsuranceCoverage),
    assertz(insurance_coverage(InsuranceCoverage)).


start :-
    write('Welcome to the Finance Advice Expert System!'), nl,
    ask_financial_status,
    findall(Advice, advice(Advice), Advices),
    (Advices \= [] ->
        (write('Based on your financial status, we recommend: '),
         print_advice(Advices));
         write('Sorry, no specific advice matches your financial status.')),
    clean_up.


print_advice([]).
print_advice([H|T]) :-
    write('- '), write(H), nl,
    print_advice(T).


clean_up :-
    retractall(income(_)),
    retractall(expenses(_)),
    retractall(savings(_)),
    retractall(debt(_)),
    retractall(investments(_)),
    retractall(credit_score(_)),
    retractall(age(_)),
    retractall(housing_costs(_)),
    retractall(interest_rate(_)),
    retractall(dependents(_)),
    retractall(insurance_coverage(_)).




