# iRobot_test
Testing Robot class and its interactions with other objects

When tests are ran individually they succeed but fail when they are run are at once. 
A side from spec/04*.rb where by might fail do to Robot having a shield

Test would fail when ran all together due to Robot.list & Robot.robots_at? accessing all instances of previous test robots 
and adding them aswell. 
