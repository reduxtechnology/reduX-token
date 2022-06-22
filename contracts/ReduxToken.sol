// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Redux is ERC20, ERC20Burnable, Pausable, Ownable {
    using SafeMath for uint256;
    uint256 supply = 1000000000;

    address public constant ADMIN_WALLET = 0x69Ba7E86bbB074Cd5f72693DEb6ADc508D83A6bF;

    constructor() ERC20("Redux", "REDUX") {
        _mint(ADMIN_WALLET, supply);
        transferOwnership(ADMIN_WALLET);  
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}