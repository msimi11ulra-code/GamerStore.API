namespace GamerStore.API.Models
{
    public class Order
    {
        public int Id { get; set; }
        public DateTime OrderDate { get; set; } = DateTime.Now;
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }
        public decimal TotalAmount { get; set; }
        public string Status { get; set; } = "جديد";
        public List<OrderItem> Items { get; set; }
    }
}
