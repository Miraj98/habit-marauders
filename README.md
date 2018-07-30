# habit-marauders
Gamifying habits through a type of PoS implementation

**Details:**
- The idea is to incentivise users to form good habits.
- Users will be rewarded with in-app tokens if they complete their productivity goals.
- Those tokens can then act as a currency that fuels a decentralised RPG-style game.

**Inspiration:**

Habitica: https://habitica.com/static/home



**Things/features implemented:**
- Making a new Avatar.
- Adding new habits to the Avatar.
- The user can lock funds when he/she starts a new habit
- They are rewarded with in-app tokens if they complete all their habit sessions before losing their Avatar's health points. Avatars lose their health if the user does not complete his/her task before a particluar day that he/she has decided.

**Run:**
1. git clone or download zip
2. `cd habit-marauders`
3. `truffle compile`
4. `truffle develop`
5. `migrate`
6. Call contract functions as desired.

**Notes:**

UI is not yet operational but the contract can be interacted with on Truffle console. However, it is much recommended to test the contract functionalities through the Remix IDE at https://remix.ethereum.org .

For Example:
run the following command in the truffle console to create a new avatar
`HabitContract.deployed().then(function(instance){instance.createAvatar("A_NAME")})`
Enter as many names as you like.
To see the names enter:
`HabitContract.deployed().then(function(instance){return instance.avatars(#)})`
The "#" in `avatars(#)` indicates the number in the array you'd like to call. Start at "0" for the first name entered.
