# habit-marauders
Gamifying productivity by using the power of decentralised networks

**Run**
1. git clone or download zip
2. `cd habit-marauders`
3. `truffle compile`
4. `truffle develop`
5. `migrate`
6. Call contract functions as desired.

**Notes**
May need to remove .json files from `/build` directory and then `truffle compile`

UI is not yet operational but the contract can be interacted with on Truffle console.

For Example:
run the following command in the truffle console to create a new avatar
`HabitContract.deployed().then(function(instance){instance.createAvatar("A_NAME")})`
Enter as many names as you like.
To see the names enter:
`HabitContract.deployed().then(function(instance){return instance.avatars(#)})`
The "#" in `avatars(#)` indicates the number in the array you'd like to call. Start at "0" for the first name entered.
