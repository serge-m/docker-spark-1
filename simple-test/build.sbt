val sparkVersion = "1.6.1"

val app = Some("com.contovista.WordCount")

scalacOptions ++= Seq("-unchecked", "-deprecation")

lazy val root = (project in file("."))
  .settings(
    organization := "com.contovista", 
    name := "simple-test",
    scalaVersion := "2.10.6",
    libraryDependencies ++= Seq(
      // Spark
      "org.apache.spark" %% "spark-core" % sparkVersion % "provided",
      "org.apache.spark" %% "spark-sql" % sparkVersion % "provided"
    ),
    mainClass in (Compile, run) := app,
    mainClass in assembly := app
  )
