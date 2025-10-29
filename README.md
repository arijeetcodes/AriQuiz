# 🎯 AriQuiz - Blockchain Quiz Platform

> A decentralized quiz platform built on blockchain where knowledge pays! Answer questions correctly and earn crypto rewards.

<img width="1527" height="810" alt="image" src="https://github.com/user-attachments/assets/f38b87e1-be34-4afd-8d32-604753a6a9c5" />

[![Solidity](https://img.shields.io/badge/Solidity-0.8.0-363636?style=for-the-badge&logo=solidity)](https://soliditylang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Celo](https://img.shields.io/badge/Celo-Sepolia-35D07F?style=for-the-badge&logo=celo)](https://celo.org/)

---

## 📋 Project Description

**AriQuiz** is a simple yet powerful blockchain-based quiz platform that revolutionizes how we think about online learning and trivia. Built on the Celo blockchain, AriQuiz allows quiz creators to reward participants with cryptocurrency for answering questions correctly. Every answer is verified on-chain, and rewards are distributed automatically through smart contracts.

This project demonstrates the perfect blend of education and blockchain technology, making learning both fun and financially rewarding!

---

## 🚀 What It Does

AriQuiz enables:

- **🧠 Quiz Creation**: Platform owners can create engaging quiz questions with custom rewards
- **💰 Instant Rewards**: Users receive crypto payments immediately upon answering correctly
- **🔒 Secure Verification**: Answers are cryptographically hashed, ensuring fairness and preventing cheating
- **📊 Score Tracking**: Each user's earnings and participation history are permanently recorded on-chain
- **🎮 One-Time Participation**: Each user can answer each question only once, ensuring fair competition
- **🌐 Decentralized**: Fully transparent, trustless, and censorship-resistant

---

## ✨ Features

### For Quiz Creators (Contract Owner)
- ✅ **Add Questions**: Create quiz questions with custom reward amounts
- ✅ **Manage Questions**: Toggle questions active/inactive status
- ✅ **Fund Management**: Deposit and withdraw funds from the contract
- ✅ **Flexible Rewards**: Set different reward amounts for different questions

### For Quiz Participants
- ✅ **Browse Questions**: View all available quiz questions
- ✅ **Submit Answers**: Answer questions and receive instant feedback
- ✅ **Earn Rewards**: Get paid in crypto for correct answers
- ✅ **Track Progress**: View your total earnings and answer history
- ✅ **Fair Play**: Each question can only be answered once per user

### Technical Features
- 🔐 **Secure Answer Hashing**: Correct answers are stored as hashes (keccak256)
- ⛽ **Gas Optimized**: Efficient storage and computation patterns
- 📢 **Event Logging**: Complete transparency with blockchain events
- 💎 **Clean Code**: Well-documented, beginner-friendly Solidity code
- 🛡️ **Access Control**: Owner-only functions for platform management

---

## 🏗️ How It Works

```
1. Owner deploys the contract with a default reward amount
2. Owner adds funds to the contract
3. Owner creates quiz questions with rewards
4. Users browse available questions
5. Users submit their answers
6. Smart contract verifies the answer
7. If correct → User receives reward instantly! 🎉
8. User's score is updated on-chain
```

---

## 📜 Smart Contract Details

### Deployed Contract
- **Network**: Celo Alfajores Testnet
- **Contract Address**: `0xB7389A19BCc34ffe86b6EF5339E06Cc56C3431D8`
- **Explorer**: [View on BlockScout](https://celo-sepolia.blockscout.com/address/0xB7389A19BCc34ffe86b6EF5339E06Cc56C3431D8)

### Main Functions

| Function | Access | Description |
|----------|--------|-------------|
| `addQuestion()` | Owner Only | Add a new quiz question with answer and reward |
| `submitAnswer()` | Public | Submit an answer to a question |
| `getQuestion()` | Public | View question details |
| `depositFunds()` | Public | Add ETH to fund rewards |
| `withdraw()` | Owner Only | Withdraw funds from contract |
| `getUserScore()` | Public | Check total rewards earned by a user |
| `getContractBalance()` | Public | Check contract's ETH balance |

---

## 🎮 How to Use

### For Users (Participants)

1. **Connect Your Wallet**
   - Use MetaMask or any Web3 wallet
   - Switch to Celo Sepolia Testnet

2. **Browse Questions**
   ```solidity
   // Call getQuestion with question ID
   getQuestion(0) // Returns question text, reward, status
   ```

3. **Submit Your Answer**
   ```solidity
   // Submit answer (case-sensitive!)
   submitAnswer(0, "Your Answer")
   ```

4. **Check Your Score**
   ```solidity
   getUserScore(YOUR_ADDRESS)
   ```

### For Owner (Quiz Creator)

1. **Deploy the Contract**
   - Set initial reward amount (in wei)
   - Example: `1000000000000000000` (1 ETH)

2. **Fund the Contract**
   ```solidity
   depositFunds() // Send ETH with transaction
   ```

3. **Add Questions**
   ```solidity
   addQuestion(
     "What is the capital of France?",
     "Paris",
     500000000000000000 // 0.5 ETH reward
   )
   ```

4. **Manage Questions**
   ```solidity
   toggleQuestionStatus(0) // Activate/deactivate question
   ```

---

## 🛠️ Technologies Used

- **Solidity ^0.8.0** - Smart contract programming language
- **Celo Blockchain** - Fast, mobile-first blockchain platform
- **OpenZeppelin Standards** - Security best practices
- **Keccak256 Hashing** - Cryptographic answer verification

---

## 📦 Installation & Development

### Prerequisites
- Node.js v14+ 
- npm or yarn
- Hardhat or Truffle
- MetaMask wallet

### Setup
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/ariquiz.git
cd ariquiz

# Install dependencies
npm install

# Compile contracts
npx hardhat compile

# Run tests
npx hardhat test

# Deploy to testnet
npx hardhat run scripts/deploy.js --network celo-alfajores
```

---

## 🔐 Security Considerations

- ✅ Answer hashing prevents answer exposure on-chain
- ✅ One answer per user per question prevents spam
- ✅ Owner-only functions for critical operations
- ✅ Balance checks before reward transfers
- ⚠️ **Note**: This is a beginner-friendly contract for learning purposes. For production use, consider:
  - Adding reentrancy guards
  - Implementing withdrawal patterns
  - Professional security audit
  - Upgradeability features

---

## 🗺️ Roadmap

- [ ] Multiple choice questions
- [ ] Timed quizzes
- [ ] Leaderboard system
- [ ] Question categories
- [ ] NFT badges for top scorers
- [ ] Frontend web application
- [ ] Mobile app integration

---

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Improve documentation

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Your Name**
- GitHub: [@arijeetcodes](https://github.com/arijeetcodes)
- Twitter: [@ArijeetNit88073](https://twitter.com/ArijeetNit88073)

---

## 🌟 Show Your Support

Give a ⭐️ if you like this project!

---

## 📞 Contact & Support

Have questions? Feel free to reach out!
- Open an issue on GitHub
- Email: arijeetnit@gmail.com

---

<div align="center">
  <p>Built with ❤️ for the blockchain community</p>
  <p>Made possible by <a href="https://celo.org">Celo</a></p>
</div>
