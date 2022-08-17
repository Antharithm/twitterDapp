import React from "react";
import './TweetInFeed.css';
import { defaultImgs } from "../defaultImgs";
import { Avatar } from "@web3uikit/core";
import { MessageCircle,Star,Matic } from "@web3uikit/icons";

const TweetInFeed = () => {
    return (
        <>
            <div className="feedTweet">
                <Avatar isRounded image={defaultImgs[0]} theme="image" size={60} />
                <div className="who?">
                    Elon Musk
                    <div className="accWhen">0x0983145708934758903245739847</div>
                </div>
                <div className="tweetContent">
                    Nice day learning web3 developement
                    <img src={defaultImgs[1]} className="tweetImg" />
                </div>
                <div className="interactions">
                    <div className="interactionNums"><MessageCircle fontSize={20} /></div>
                    <div className="interactionNums"><Star fontSize={20} /></div>
                    <div className="interactionNums"><Matic fontSize={20} /></div>
                </div>
            </div>
        </>
    );
}

export default TweetInFeed;