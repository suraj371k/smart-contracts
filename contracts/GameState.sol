// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GameState {
    enum State {
        NotStarted,
        Playing,
        Paused,
        Finished
    }

    State public currentState = State.NotStarted;

    function startGame() public {
        require(currentState == State.NotStarted, "invalid selection");
        currentState = State.Playing;
    }

    function pauseGame() public {
        require(currentState == State.Playing, "Invalid selection");
        currentState = State.Paused;
    }

    function resume() public {
        require(currentState == State.Paused , "you must be paused to resume");
        currentState = State.Playing;
    }

    function finishGame() public {
        require(
            currentState == State.Playing,
            "Game must be playing to finish"
        );
        currentState = State.Finished;
    }

    function restartGame() public {
        require(currentState == State.Finished , "you must be finished to restart new game");
        currentState = State.Playing;
    }
}
