// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "hardhat/console.sol";
contract TwitterDapp {
    address public owner;
    uint256 private counter; // represent ID of a tweet
    
    constructor() {
        owner = msg.sender;
        counter = 0;
    }
    // structure of a tweet
    struct tweet {
        address tweeter;
        uint256 id;
        string tweetText;
        string tweetImg;
        bool isDeleted;
        uint256 timestamp;
    }
    // structure of a user account
    struct user {
        string name;
        string bio;
        string profileImg;
        string profileBanner;
    }

    mapping(uint256 => tweet) Tweets; // id to a tweet struct
    mapping(address => user) Users; // address to a user struct

    event tweetCreated(
        address tweeter,
        uint256 id,
        string tweetText,
        string tweetImg,
        bool isDeleted,
        uint256 timestamp
    );

    event tweetDeleted(
        uint256 tweetId,
        bool isDeleted
    );

    // Method for adding a Tweet
    function addTweet(string memory tweetText, string memory tweetImg) public payable {
        require(msg.value == (1 ether), "Please submit 1 MATIC");
        tweet storage newTweet = Tweets[counter];
        newTweet.tweetText = tweetText;
        newTweet.tweetImg = tweetImg;
        newTweet.tweeter = msg.sender;
        newTweet.id = counter;
        newTweet.isDeleted = false;
        newTweet.timestamp = block.timestamp;
        emit tweetCreated(msg.sender, counter, tweetText, tweetImg, false, block.timestamp);
        counter++;
        payable(owner).transfer(msg.value);
    }

    // Method to fetch all tweets on users timeline
    function getAllTweets() public view returns (tweet[] memory) {
        tweet[] memory temporary = new tweet[](counter);
        uint countTweets = 0;

        for(uint i = 0; i < counter; i++){
            if(Tweets[i].isDeleted == false) {
                temporary[countTweets] = Tweets[i]; // then add this tweet to temporary array
                countTweets++;
            }
        }

        tweet[] memory result = new tweet[](countTweets);
        for(uint i = 0; i < countTweets; i++) {
            result[i] = temporary[i];
        }

        return result;
    }

    // Method to get all tweet of a particular user
    function getMyTweets() external view returns (tweet[] memory) {
        tweet[] memory temporary = new tweet[](counter);
        uint countMyTweets = 0;

        for(uint i = 0; i < counter; i++) {
            if(Tweets[i].tweeter == msg.sender && Tweets[i].isDeleted == false) {
                temporary[countMyTweets] = Tweets[i];
                countMyTweets++;
            }
        }

        tweet[] memory result = new tweet[](countMyTweets);
        for(uint i = 0; i < countMyTweets; i++) {
            result[i] = temporary[i];
        }
        return result;
    }

    // Method to get a particular tweet
    function getTweet(uint256 id) public view returns (string memory, string memory, address) {
        require(id < counter, "No such Tweet");
        tweet storage t = Tweets[id];
        require(t.isDeleted == false, "Tweet has been deleted");
        return(t.tweetText, t.tweetImg, t.tweeter);
    }

    // Method to delete a tweet
    function deleteTweet(uint tweetId, bool isDeleted) external {
        require(Tweets[tweetId].tweeter == msg.sender, "You can only delete your own tweets");
        Tweets[tweetId].isDeleted = isDeleted;
        emit tweetDeleted(tweetId, isDeleted);
    }

    // Method to update user details
    function updateUser(string memory newName, string memory newBio, string memory newProfileImg, string memory newProfileBanner) public {
        user storage userData = Users[msg.sender];
        userData.name = newName;
        userData.bio = newBio;
        userData.profileImg = newProfileImg;
        userData.profileBanner = newProfileBanner;
    }

    // Method to get user details
    function getUser(address userAddress) public view returns (user memory) {
        return Users[userAddress];
    }
}