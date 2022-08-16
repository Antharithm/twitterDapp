import React from 'react';
import './Rightbar.css';
import twitter from '../images/twitterLogo.png';
import solidity from '../images/solidityLogo.png';
import react from '../images/reactLogo.png';
import { Input } from '@web3uikit/core';
import { Search } from '@web3uikit/icons';

const Rightbar = () => {
    const trends = [
        {
            img:twitter,
            text: "Decentralized Twitter",
            link: "#",
        },
        {
            img:solidity,
            text: "Master smart contract development!",
            link: "#",
        },
        {
            img:react,
            text: "Master React.js",
            link: "#",
        },
    ];
    
    return (
        <>
        <div className='rightbarContent'>
            <Input label='Search Twitter' name='Search Twitter' prefixIcon={<Search/>} labelBgColor="#141d26"></Input>
        <div className='trends'>
            Trending
            {
                trends.map((e)=>{
                    return (
                        <>
                        <div className='trend' onClick={()=>window.open(e.link)}></div>
                            <img src={e.img} className='trendImg'></img>
                            <div className='trendText'>{e.text}</div>
                        </>
                    );
                })
            }
        </div>
        </div>
        </>
    );
};

export default Rightbar;