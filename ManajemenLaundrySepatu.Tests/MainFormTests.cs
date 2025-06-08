using Microsoft.VisualStudio.TestTools.UnitTesting;
using ManajemenLaundrySepatu;

namespace ManajemenLaundrySepatu.Tests
{
    [TestClass]
    public class MainFormTests
    {
        [TestMethod]
        public void HashPassword_InputKnownPassword_ReturnsExpectedHash()
        {
            string inputPassword = "password123";
            string expectedHash = "ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f";

            string actualHash = mainForm.HashPassword(inputPassword);

            Assert.AreEqual(expectedHash, actualHash);
        }

        [TestMethod]
        public void HashPassword_EmptyPassword_ReturnsCorrectHash()
        {
            string hash = mainForm.HashPassword("");
            Assert.AreEqual("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", hash);
        }
    }
}
