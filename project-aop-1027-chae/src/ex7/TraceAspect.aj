package ex7;

public aspect TraceAspect {
	
	// pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	pointcut classToTrace(): within(*App); 
	pointcut methodToTrace(): classToTrace() && execution(String getName(..)); // ex7.*.getName() not needed? 
	
	before(): methodToTrace() {
		System.out.println("[BGN] " + thisJoinPointStaticPart.getSignature() + ", " //
				+ thisJoinPointStaticPart.getSourceLocation().getLine()); 
	}
	
	after(): methodToTrace() {
		System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName() + "\n");
	}
	
}
