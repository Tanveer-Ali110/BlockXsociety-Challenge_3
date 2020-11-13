pragma experimental ABIEncoderV2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";

contract Challenge3 is Ownable{
    
    using SafeMath for uint256;
    
    uint256 public count;
    
    mapping (uint256 => Todo) TodoList; 
    
    
    struct Todo{
        string tasks;
    }
    
    constructor () public{
        count = 0;
    }
    
    function setTodoList(string memory _input) public onlyOwner{
        
        TodoList[count].tasks = _input;
        count = count.add(1);
        
    }
    
    function getTodoList() view public returns(string[] memory){
        
        string[] memory outPut = new string[](count);
        
        for(uint i=0;i<count;i++){
        outPut[i] = TodoList[i].tasks;
        }
        return  outPut;
    }
    
}