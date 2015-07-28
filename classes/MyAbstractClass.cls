public abstract class MyAbstractClass {
	

	protected abstract MyAbstractClass getInstance();

	protected void validate(){
		System.Debug('I am in validate method in MyAbstractClass...');
	}

	protected virtual void myTest(){}
}