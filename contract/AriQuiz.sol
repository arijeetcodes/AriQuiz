// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title AriQuiz
 * @dev A simple blockchain quiz platform that rewards correct answers
 */
contract AriQuiz {
    // Contract owner
    address public owner;
    
    // Reward amount for each correct answer (in wei)
    uint256 public rewardAmount;
    
    // Quiz question structure
    struct Question {
        string questionText;
        bytes32 correctAnswerHash; // Hashed answer for security
        uint256 reward;
        bool isActive;
    }
    
    // Mapping from question ID to Question
    mapping(uint256 => Question) public questions;
    
    // Counter for question IDs
    uint256 public questionCount;
    
    // Track which users have answered which questions
    mapping(address => mapping(uint256 => bool)) public hasAnswered;
    
    // User scores (total rewards earned)
    mapping(address => uint256) public userScores;
    
    // Events
    event QuestionAdded(uint256 indexed questionId, string questionText, uint256 reward);
    event AnswerSubmitted(address indexed user, uint256 indexed questionId, bool correct);
    event RewardPaid(address indexed user, uint256 amount);
    event FundsDeposited(address indexed sender, uint256 amount);
    
    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    /**
     * @dev Constructor sets the contract owner and default reward
     */
    constructor(uint256 _rewardAmount) {
        owner = msg.sender;
        rewardAmount = _rewardAmount;
    }
    
    /**
     * @dev Add a new question (only owner)
     * @param _questionText The question text
     * @param _correctAnswer The correct answer (will be hashed)
     * @param _reward Reward amount for this question
     */
    function addQuestion(
        string memory _questionText,
        string memory _correctAnswer,
        uint256 _reward
    ) public onlyOwner {
        // Hash the correct answer for security
        bytes32 answerHash = keccak256(abi.encodePacked(_correctAnswer));
        
        questions[questionCount] = Question({
            questionText: _questionText,
            correctAnswerHash: answerHash,
            reward: _reward,
            isActive: true
        });
        
        emit QuestionAdded(questionCount, _questionText, _reward);
        questionCount++;
    }
    
    /**
     * @dev Submit an answer to a question
     * @param _questionId The ID of the question
     * @param _answer The user's answer
     */
    function submitAnswer(uint256 _questionId, string memory _answer) public {
        require(_questionId < questionCount, "Question does not exist");
        require(questions[_questionId].isActive, "Question is not active");
        require(!hasAnswered[msg.sender][_questionId], "You have already answered this question");
        
        // Mark as answered
        hasAnswered[msg.sender][_questionId] = true;
        
        // Check if answer is correct
        bytes32 answerHash = keccak256(abi.encodePacked(_answer));
        bool isCorrect = (answerHash == questions[_questionId].correctAnswerHash);
        
        emit AnswerSubmitted(msg.sender, _questionId, isCorrect);
        
        // Pay reward if correct
        if (isCorrect) {
            uint256 reward = questions[_questionId].reward;
            require(address(this).balance >= reward, "Insufficient contract balance");
            
            userScores[msg.sender] += reward;
            payable(msg.sender).transfer(reward);
            
            emit RewardPaid(msg.sender, reward);
        }
    }
    
    /**
     * @dev Get question details (without revealing the answer)
     * @param _questionId The ID of the question
     */
    function getQuestion(uint256 _questionId) public view returns (
        string memory questionText,
        uint256 reward,
        bool isActive,
        bool userHasAnswered
    ) {
        require(_questionId < questionCount, "Question does not exist");
        Question memory q = questions[_questionId];
        return (
            q.questionText,
            q.reward,
            q.isActive,
            hasAnswered[msg.sender][_questionId]
        );
    }
    
    /**
     * @dev Toggle question active status (only owner)
     * @param _questionId The ID of the question
     */
    function toggleQuestionStatus(uint256 _questionId) public onlyOwner {
        require(_questionId < questionCount, "Question does not exist");
        questions[_questionId].isActive = !questions[_questionId].isActive;
    }
    
    /**
     * @dev Update default reward amount (only owner)
     * @param _newReward New reward amount
     */
    function updateRewardAmount(uint256 _newReward) public onlyOwner {
        rewardAmount = _newReward;
    }
    
    /**
     * @dev Deposit funds to the contract
     */
    function depositFunds() public payable {
        require(msg.value > 0, "Must send some ETH");
        emit FundsDeposited(msg.sender, msg.value);
    }
    
    /**
     * @dev Withdraw funds from contract (only owner)
     * @param _amount Amount to withdraw
     */
    function withdraw(uint256 _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Insufficient balance");
        payable(owner).transfer(_amount);
    }
    
    /**
     * @dev Get contract balance
     */
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    /**
     * @dev Get user's total score
     * @param _user User address
     */
    function getUserScore(address _user) public view returns (uint256) {
        return userScores[_user];
    }
    
    /**
     * @dev Allow contract to receive ETH
     */
    receive() external payable {
        emit FundsDeposited(msg.sender, msg.value);
    }
}
